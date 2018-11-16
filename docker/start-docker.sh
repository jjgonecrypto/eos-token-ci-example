#!/bin/bash

set -eox pipefail

docker run \
  --rm \
  --publish 127.0.0.1:5555:5555 \
  --detach \
  justinjmoses/eosio-ci \
  /start-keosd.sh

docker run \
  --rm \
  --publish 7777:7777 \
  --detach \
  justinjmoses/eosio-ci \
  /start-nodeos.sh
