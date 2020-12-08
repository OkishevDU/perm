!/bin/bash
set -x
IP1=$1
IP2=$2
IP3=$3
IP4=$4
IP5=$5
IP6=$6
COUNT=$7
cd
cd exonum/examples/cryptocurrency-advanced/backend
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP1:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP1:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP1:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP1:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP1:8095/api/system/v1/peers

curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP2:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP2:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP2:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP2:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP2:8095/api/system/v1/peers

curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP3:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP3:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP3:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP3:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP3:8095/api/system/v1/peers

curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP4:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP4:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP4:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP4:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://$IP4:8095/api/system/v1/peers

curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP5:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP5:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP5:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP5:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP5:8095/api/system/v1/peers

curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP6:8091/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP6:8092/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP6:8093/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP6:8094/api/system/v1/peers
curl -H "Content-Type: application/json" --data @key_$COUNT.json http://1$IP6:8095/api/system/v1/peers
