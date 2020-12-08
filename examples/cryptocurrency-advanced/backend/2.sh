#!/bin/bash
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/1/node.toml --db-path example/1/db --public-api-address 0.0.0.0:8200 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/1/node01.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/2/node.toml --db-path example/2/db --public-api-address 0.0.0.0:8201 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/2/node02.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/3/node.toml --db-path example/3/db --public-api-address 0.0.0.0:8202 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/3/node03.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/4/node.toml --db-path example/4/db --public-api-address 0.0.0.0:8203 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/4/node04.log 2>&1 &
RUST_LOG="info" exonum-cryptocurrency-advanced run --node-config example/5/node.toml --db-path example/5/db --public-api-address 0.0.0.0:8204 --master-key-pass pass > /home/user/exonum/examples/cryptocurrency-advanced/backend/example/5/node05.log 2>&1 &


