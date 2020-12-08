#!/bin/bash
set -x
IP1=$1
exonum-cryptocurrency-advanced finalize --public-api-address $IP1:8200 --private-api-address $IP1:8091 example/26/sec.toml example/26/node.toml --public-configs example/26/pub.toml example/27/pub.toml example/28/pub.toml example/29/pub.toml example/30/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address $IP1:8201 --private-api-address $IP1:8092 example/27/sec.toml example/27/node.toml --public-configs example/26/pub.toml example/27/pub.toml example/28/pub.toml example/29/pub.toml example/30/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address $IP1:8202 --private-api-address $IP1:8093 example/28/sec.toml example/28/node.toml --public-configs example/26/pub.toml example/27/pub.toml example/28/pub.toml example/29/pub.toml example/30/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address $IP1:8203 --private-api-address $IP1:8094 example/29/sec.toml example/29/node.toml --public-configs example/26/pub.toml example/27/pub.toml example/28/pub.toml example/29/pub.toml example/30/pub.toml
exonum-cryptocurrency-advanced finalize --public-api-address $IP1:8204 --private-api-address $IP1:8095 example/30/sec.toml example/30/node.toml --public-configs example/26/pub.toml example/27/pub.toml example/28/pub.toml example/29/pub.toml example/30/pub.toml

 