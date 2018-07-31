#!/usr/bin/env bash

echo "Compile Smart contract [${CONTRACT_NAME}]"
/usr/bin/solc /loom/contracts/${CONTRACT_NAME}.sol --bin --abi --optimize --overwrite -o /loom/contracts


echo "Init Loom"
/loom/loom init --force

echo "Generate Genesis file"
eval "echo \"$(cat /scripts/genesis-template.json)\"" > /loom/genesis.json


echo "Config file"
cp /scripts/loom.yml /loom/loom.yml

echo "Run Loom"
/loom/loom run
