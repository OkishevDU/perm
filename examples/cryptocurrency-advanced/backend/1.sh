#!/bin/bash
clear
cd
killall -INT exonum-cryptocurrency-advanced
cd exonum/examples/cryptocurrency-advanced/backend
rm -R example
mkdir example
exonum-cryptocurrency-advanced generate-template example/common.toml --validators-count 5

exonum-cryptocurrency-advanced generate-config example/common.toml example/1 --peer-address 127.0.0.1:6331 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/2 --peer-address 127.0.0.1:6332 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/3 --peer-address 127.0.0.1:6333 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/4 --peer-address 127.0.0.1:6334 -n
exonum-cryptocurrency-advanced generate-config example/common.toml example/5 --peer-address 127.0.0.1:6335 -n
exonum-cryptocurrency-advanced finalize --public-api-address 0.0.0.0:8200 --private-api-address 0.0.0.0:8091 example/1/sec.toml example/1/node.toml --public-configs example/1/pub.toml example/2/pub.toml example/3/pub.toml example/4/pub.toml example/5/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address 0.0.0.0:8201 --private-api-address 0.0.0.0:8092 example/2/sec.toml example/2/node.toml --public-configs example/1/pub.toml example/2/pub.toml example/3/pub.toml example/4/pub.toml example/5/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address 0.0.0.0:8202 --private-api-address 0.0.0.0:8093 example/3/sec.toml example/3/node.toml --public-configs example/1/pub.toml example/2/pub.toml example/3/pub.toml example/4/pub.toml example/5/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address 0.0.0.0:8203 --private-api-address 0.0.0.0:8094 example/4/sec.toml example/4/node.toml --public-configs example/1/pub.toml example/2/pub.toml example/3/pub.toml example/4/pub.toml example/5/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address 0.0.0.0:8204 --private-api-address 0.0.0.0:8095 example/5/sec.toml example/5/node.toml --public-configs example/1/pub.toml example/2/pub.toml example/3/pub.toml example/4/pub.toml example/5/pub.toml


