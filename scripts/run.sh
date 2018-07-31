#!/usr/bin/env bash

echo "Compile Smart contract [${CONTRACT_NAME}]"
/usr/bin/solc /loom/contracts/${CONTRACT_NAME}.sol --bin --abi --optimize -o /loom/contracts 2>/dev/null


echo "Init Loom"
/loom/loom init


echo "Generate Genesis file"
eval "echo \"$(cat /scripts/genesis-template.json)\"" > genesis.json

echo "Run Loom"
/loom/loom run
