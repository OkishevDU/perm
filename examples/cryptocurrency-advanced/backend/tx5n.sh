#!/bin/bash
set -x
cd
cd exonum/examples/cryptocurrency-advanced/backend
COUNT=$1
SEED=100
kill `pidof python3.6`
python3.6 tx_stats.py -n http://127.0.0.1:8200 > stats1.log &
tx-generator --service_id 3 --api 127.0.0.1:8200  --api 127.0.0.1:8201  --api 127.0.0.1:8202 --api 127.0.0.1:8203 --api 127.0.0.1:8204  --count $COUNT --seed $SEED --timeout 10 create-wallets
tx-generator --service_id 3 --api 127.0.0.1:8200  --api 127.0.0.1:8201  --api 127.0.0.1:8202 --api 127.0.0.1:8203 --api 127.0.0.1:8204  --count $COUNT --seed $SEED transfer --wallets-count $COUNT --wallets-seed $SEED
