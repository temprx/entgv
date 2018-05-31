#!/usr/bin/env bash

sed -i "s/{ADDRESS}/$ADDRESS/g" /ulordrig/build/config.json
sed -i "s/{POOL_ADDRESS}/$POOL_ADDRESS/g" /ulordrig/build/config.json
sed -i "s/{MINER_NAME}/$MINER_NAME/g" /ulordrig/build/config.json
sed -i "s/{THREADS}/$THREADS/g" /ulordrig/build/config.json
sed -i "s/{PASS}/$PASS/g" /ulordrig/build/config.json

ps -ef | grep ulordrig | awk '{print $2}' | xargs -n 1  kill -9

sleep 3

