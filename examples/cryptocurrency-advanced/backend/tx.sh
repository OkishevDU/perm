#!/bin/bash
set -x
cd
cd exonum/examples/cryptocurrency-advanced/backend
COUNT=$1
SEED=$2
kill `pidof python3.6`
python3.6 tx_stats.py -n http://192.168.101.37:8200 > stats1.log &
tx-generator --service_id 3 --api 192.168.101.37:8200  --api 192.168.101.37:8201  --api 192.168.101.37:8202 --api 192.168.101.37:8203 --api 192.168.101.37:8204 --api 192.168.102.37:8200  --api 192.168.102.37:8201  --api 192.168.102.37:8202 --api 192.168.102.37:8203 --api 192.168.102.37:8204  --api 192.168.103.38:8200  --api 192.168.103.38:8201  --api 192.168.103.38:8202 --api 192.168.103.38:8203 --api 192.168.103.38:8204  --api 192.168.104.36:8200 --api 192.168.104.36:8201  --api 192.168.104.36:8202 --api 192.168.104.36:8203 --api 192.168.104.36:8204 --api 192.168.105.36:8200  --api 192.168.105.36:8201  --api 192.168.105.36:8202 --api 192.168.105.36:8203 --api 192.168.105.36:8204 --count $COUNT --seed $SEED --timeout 10 create-wallets
tx-generator --service_id 3 --api 192.168.101.37:8200  --api 192.168.101.37:8201  --api 192.168.101.37:8202 --api 192.168.101.37:8203 --api 192.168.101.37:8204 --api 192.168.102.37:8200  --api 192.168.102.37:8201  --api 192.168.102.37:8202 --api 192.168.102.37:8203 --api 192.168.102.37:8204  --api 192.168.103.38:8200  --api 192.168.103.38:8201  --api 192.168.103.38:8202 --api 192.168.103.38:8203 --api 192.168.103.38:8204  --api 192.168.104.36:8200  --api 192.168.104.36:8201  --api 192.168.104.36:8202 --api 192.168.104.36:8203 --api 192.168.104.36:8204 --api 192.168.105.36:8200  --api 192.168.105.36:8201  --api 192.168.105.36:8202 --api 192.168.105.36:8203 --api 192.168.105.36:8204 --count $COUNT --seed $SEED transfer --wallets-count $COUNT --wallets-seed $SEED