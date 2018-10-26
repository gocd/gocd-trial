#!/bin/bash

set -Eeuo pipefail

while [ ! -f '/shared/autoregister.key' ]; do
  echo 'Waiting for server to decide agent auto registration key ...'
  sleep 3
done

uuid=$(cat '/shared/autoregister.key')

sed -i -e "s/agent.auto.register.key=.*/agent.auto.register.key=${uuid}/" '/go/config/autoregister.properties'
