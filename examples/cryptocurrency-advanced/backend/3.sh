#!/bin/bash
cd
cd exonum/examples/cryptocurrency-advanced/backend
python3.6 tx_stats.py -n http://127.0.0.1:8200 > stats5.log &
tx-generator --service_id 0 --api 127.0.0.1:8200  --api 127.0.0.1:8201  --api 127.0.0.1:8202 --api 127.0.0.1:8203 --api 127.0.0.1:8204 --api 127.0.0.1:8205 --count 1000 --seed 1 --timeout 10 create-wallets
tx-generator --service_id 0 --api 127.0.0.1:8200  --api 127.0.0.1:8201  --api 127.0.0.1:8202 --api 127.0.0.1:8203 --api 127.0.0.1:8204 --api 127.0.0.1:8205 --count 1000 --seed 1 transfer --wallets-count 1000 --wallets-seed 1
