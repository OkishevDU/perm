#!/bin/bash
cd
cd exonum/examples/cryptocurrency-advanced/backend
rm -Rf example
mkdir example
IP=$1
exonum-cryptocurrency-advanced generate-template example/common.toml --validators-count 5

exonum-cryptocurrency-advanced generate-config example/common.toml example/26 --peer-address $IP1:6331 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/27 --peer-address $IP1:6332 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/28 --peer-address $IP1:6333 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/29 --peer-address $IP1:6334 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/30 --peer-address $IP1:6335 -n

