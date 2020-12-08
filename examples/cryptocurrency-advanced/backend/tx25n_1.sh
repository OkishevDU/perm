#!/bin/bash
set -x
IP1=$1
IP2=$2
IP3=$3
IP4=$4
IP5=$5
COUNT=$6
SEED=100
cd
cd exonum/examples/cryptocurrency-advanced/backend
kill `pidof python3.6`
python3.6 tx_stats_1.py -n http://$IP1:8200 > stats_25.log &
tx-generator --service_id 3 --api $IP1:8200  --api $IP1:8201  --api $IP1:8202 --api $IP1:8203 --api $IP1:8204 --api $IP2:8200  --api $IP2:8201  --api $IP2:8202 --api $IP2:8203 --api $IP2:8204 --api --api $IP3  --api $IP3:8201  --api $IP3:8202 --api $IP3:8203 --api $IP3:8204  --api $IP4:8200  --api $IP4:8201  --api $IP4:8202 --api $IP4:8203 --api $IP4:8204  --api 1$IP5:8200  --api 1$IP5:8201  --api 1$IP5:8202 --api 1$IP5:8203 --api 1$IP5:8204  --count $COUNT --seed $SEED --timeout 10 create-wallets
tx-generator --service_id 3 --api $IP1:8200  --api $IP1:8201  --api $IP1:8202 --api $IP1:8203 --api $IP1:8204  --api $IP2:8200  --api $IP2:8201  --api $IP2:8202 --api $IP2:8203 --api $IP2:8204  --api $IP3:8200  --api $IP3:8201  --api $IP3:8202 --api $IP3:8203 --api $IP3:8204 --api $IP4:8200  --api $IP4:8201  --api $IP4:8202 --api $IP4:8203 --api $IP4:8204 --api 1$IP5:8200  --api 1$IP5:8201  --api 1$IP5:8202 --api 1$IP5:8203 --api 1$IP5:8204  --count $COUNT --seed $SEED transfer --wallets-count $COUNT --wallets-seed $SEED
