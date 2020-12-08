#!/bin/bash
set -x
IP=$1
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/26/node.toml --db-path example/26/db --public-api-address $IP:8200 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/26/node026.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/27/node.toml --db-path example/27/db --public-api-address $IP:8201 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/27/node027.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/28/node.toml --db-path example/28/db --public-api-address $IP:8202 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/28/node028.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/29/node.toml --db-path example/29/db --public-api-address $IP:8203 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/29/node029.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/30/node.toml --db-path example/30/db --public-api-address $IP:8204 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/30/node030.log 2>&1 &
