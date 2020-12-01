#!/bin/bash
cd
cd exonum/examples/cryptocurrency-advanced/backend
rm -Rf example
mkdir example
N=$((5*$1))
IP=$2
exonum-cryptocurrency-advanced generate-template example/common.toml --validators-count 25
exonum-cryptocurrency-advanced generate-config example/common.toml example/$(($N-4)) --peer-address $IP:6331 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/$(($N-3)) --peer-address $IP:6332 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/$(($N-2)) --peer-address $IP:6333 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/$(($N-1)) --peer-address $IP:6334 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/$N --peer-address $IP:6335 -n
