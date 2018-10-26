#!/bin/bash

set -Eeuo pipefail

if ! grep -q 'agentAutoRegisterKey="agent-autoregister-key"' /go-working-dir/config/cruise-config.xml; then
  echo 'Agent auto registration key is already set up.'
  exit 0
fi

uuid=$(python -c 'import uuid; print str(uuid.uuid4())')

sed -i -e "s/agentAutoRegisterKey=\"agent-autoregister-key\"/agentAutoRegisterKey=\"${uuid}\"/" /go-working-dir/config/cruise-config.xml

echo -n "${uuid}" >/shared/autoregister.key
