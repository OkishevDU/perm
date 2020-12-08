#!/usr/bin/env python3

# The script outputs TPS stats in runtime
# Run example: ./tx_stats.py -n node.hostname.com:8080
# Also possible to dump statistic into cvs files if you provide
# path to the file
# E.g. ./tx_stats.py -n node.hostname.com:8080 -o /path/to/stat.cvs

import argparse
import csv
import requests
import os.path
from datetime import datetime
from time import sleep
from urllib.parse import urlparse

count_blocks = 10


class Metrics(object):
    pass

def get_hostname(hostname):
    if "http" in hostname:
        return hostname
    else:
        return "http://" + hostname


def parse_datetime(d_time):
    d_time_parts = d_time[:-1].split(".")
    return datetime.strptime(
        d_time_parts[0] + "." + d_time_parts[1][:5], "%Y-%m-%dT%H:%M:%S.%f"
    )

def block_time(data):
    current_block_time = data["blocks"][0]["time"]
    previous_block_time = data["blocks"][1]["time"]
    return parse_datetime(current_block_time) - parse_datetime(previous_block_time)


def update_stats(stats, data):
    for i, block in enumerate(data["blocks"]):
        height = block["height"]
        tx_count = block["tx_count"]
        if height in stats:  # skip existence entries
            continue
        if tx_count == 0:  # skip blocks with no transactions
            continue
        if (
            i == len(data["blocks"]) - 1
        ):  # skip last block info, we won't be able to calculate time delta
            continue
        block_time = (
            parse_datetime(data['blocks'][0]['time']) - parse_datetime(data['blocks'][1]['time'])
        ).total_seconds()
        stats[height] = tx_count / block_time


def calc_min_tps(stats):
    try:
        return int(min(stats.values()))
    except ValueError:
        return 0


def calc_max_tps(stats):
    try:
        return int(max(stats.values()))
    except ValueError:
        return 0


def calc_average_tps(stats):
    count = len(stats)
    if count == 0:
        return 0
    return int(sum(stats.values()) / count)


def calc_current_tps(data):
    delta_time = parse_datetime(data["blocks"][0]["time"]) - parse_datetime(data["blocks"][1]["time"])
    return int(data["blocks"][0]["tx_count"] / delta_time.total_seconds())


def dump_statistic(file, stats):
    with open(file, "w") as f:
        w = csv.DictWriter(f, ["height", "TPS"])
        w.writeheader()
        for height in sorted(stats.keys()):
            w.writerow({"height": height, "TPS": stats[height]})


def dump_statistic_line(file, stats):
    with open(file, "a") as f:
        w = csv.writer(f)
        w.writerow(stats)


def init_statistic_file(file):
    header_line = [
        'last_height', 'current_tps', 'avrg_tps', 'min_tps', 'max_tps',
        'block_time', 'block_tx_count', 'tx_pool_size']
    with open(file, "w") as f:
        w = csv.writer(f)
        w.writerow(header_line)


def parse_arguments():
    parser = argparse.ArgumentParser(description="Exonum node's TPS stats collector")
    parser.add_argument(
        "-s",
        "--service",
        action="store_true",
        help="Run as a system service and export metrics to Prometheus",
    )
    parser.add_argument(
        "-n", "--node", type=str, help="Exonum node's address", required=False
    )
    parser.add_argument(
        "-p", "--pushgateway", nargs=1, type=str, help="Prometheus push gateway address"
    )
    parser.add_argument(
        "-o", "--output", nargs=1, type=str, help="File name to dump data as CSV"
    )

    return parser.parse_args()

def init_prometheus(prometheus_hostname, node_hostname):
    from prometheus_client import CollectorRegistry, Gauge

    metrics = Metrics()

    metrics.registry = CollectorRegistry()
    metrics.grouping_keys = {}
    metrics.hostname = prometheus_hostname
    metric_current_tps_name = "exonum_node_tps_current"
    metric_avg_tps_name = "exonum_node_tps_average"
    metric_current_height_name = "exonum_node_current_height"
    metrics.metric_avg_tps = Gauge(
        metric_avg_tps_name, "Exonum's node average TPS", registry=metrics.registry
    )
    metrics.metric_current_height = Gauge(
        metric_current_height_name,
        "Exonum's node current height",
        registry=metrics.registry,
    )
    metrics.metric_current_tps = Gauge(
        metric_current_tps_name, "Exonum's node current TPS", registry=metrics.registry
    )
    metrics.grouping_keys["instance"] = urlparse(node_hostname).netloc
    return metrics


def send_data_to_prometheus(metrics, avrg_tps, current_tps, last_height):
    from prometheus_client import push_to_gateway

    try:
        metrics.metric_avg_tps.set(avrg_tps)
        metrics.metric_current_tps.set(current_tps)
        metrics.metric_current_height.set(last_height)
        push_to_gateway(
            metrics.hostname,
            job="StressTesting",
            registry=metrics.registry,
            grouping_key=metrics.grouping_keys,
        )
    except Exception as e:
        print("Cannot send to prometheus: {}".format(e))


def main():
    args = parse_arguments()
    hostname = get_hostname(args.node)
    #hostname = "http://127.0.0.1"
    public_port = 8200
    private_port = 8091
    if args.output:
        log_file_name = args.output[0]
    else:
        log_file_name = "result.csv"

    if not os.path.isfile(log_file_name):
        init_statistic_file(log_file_name)

    blocks_url = "{}:{}/api/explorer/v1/blocks?count={}&add_blocks_time=true".format(
        hostname, public_port, count_blocks
    )
    stats_url = "{}:{}/api/system/v1/stats".format(hostname, private_port)
    stats = dict()

    if args.service and not args.pushgateway:
        print("Push gateway address required in service mode")
        exit(1)

    # if args.pushgateway:
    #     metrics = init_prometheus(args.pushgateway[0], hostname)

    last_height = 0

    # Continuously request explorer api endpoint of the node
    while True:
        try:
            response = requests.get(blocks_url)

            if response.status_code == 200:
                data = response.json()
                update_stats(stats, data)
                min_tps = calc_min_tps(stats)
                max_tps = calc_max_tps(stats)
                avrg_tps = calc_average_tps(stats)
                current_tps = calc_current_tps(data)
                response_height = int(data["range"]["end"])

                if last_height < response_height:
                    last_height = response_height
                    block_time = data["blocks"][0]["time"]
                    block_tx_count = data["blocks"][0]["tx_count"]
                    stats_response = requests.get(stats_url)
                    if response.status_code == 200:
                        stats_data = stats_response.json()
                        tx_pool_size = stats_data["tx_pool_size"]
                    else:
                        tx_pool_size = None
                        tx_count = None

                    # Save line to csv format (['last_height', 'current_tps', 'avrg_tps', 'min_tps', 'max_tps',
                    # 'block_time', 'block_tx_count', 'tx_pool_size'])
                    stats_line = [last_height, current_tps, avrg_tps, min_tps, max_tps, block_time, block_tx_count, tx_pool_size]
                    dump_statistic_line(log_file_name, stats_line)

                    # Print output line
                    if not args.service:
                        print(
                            "min: {}, max: {}, avrg: {}, current: {}, last height: {}".format(
                                min_tps, max_tps, avrg_tps, current_tps, last_height
                            ),
                            end="\r",
                        )

                if args.pushgateway:
                    send_data_to_prometheus(metrics, avrg_tps, current_tps, last_height)

            else:
                print("Bad request", end="\r")

        except requests.exceptions.ConnectionError:
            print("Couldn't connect to host, Trying once again...", end="\r")

            sleep(1)

        except KeyboardInterrupt:
            print("Exit...")
            break

if __name__ == "__main__":
    main()
