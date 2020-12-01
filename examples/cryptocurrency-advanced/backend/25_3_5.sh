#!/bin/bash
N=$((5*$1))
IP=$2
set -x
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/$(($N-4))/node.toml --db-path example/$(($N-4))/db --public-api-address $IP:8200 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/$(($N-4))/node0$(($N-4)).log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/$(($N-3))/node.toml --db-path example/$(($N-3))/db --public-api-address $IP:8201 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/$(($N-3))/node0$(($N-3)).log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/$(($N-2))/node.toml --db-path example/$(($N-2))/db --public-api-address $IP:8202 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/$(($N-2))/node0$(($N-2)).log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/$(($N-1))/node.toml --db-path example/$(($N-1))/db --public-api-address $IP:8203 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/$(($N-1))/node0$(($N-1)).log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/$N/node.toml --db-path example/$N/db --public-api-address $IP:8204 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/$N/node0$N.log 2>&1 &
