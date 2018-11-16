#!/bin/bash

set -eox pipefail

# local mode for testing
exec nodeos \
  --http-server-address=0.0.0.0:7777 \
  --enable-stale-production \
  --producer-name=eosio \
  --plugin eosio::chain_api_plugin \
  --plugin eosio::history_api_plugin \
  --verbose-http-errors

# full node startup (for reference)
# exec nodeos \
#   --http-server-address=0.0.0.0:7777 \
#   --plugin=eosio::producer_plugin \
#   --plugin=eosio::http_plugin \
#   --plugin=eosio::chain_api_plugin \
#   --plugin=eosio::history_plugin \
#   --plugin=eosio::history_api_plugin \
#   --plugin=eosio::http_plugin \
#   --data-dir=/mnt/dev/data \
#   --enable-stale-production \
#   --producer-name=eosio \
#   --config-dir=/mnt/dev/config \
#   --access-control-allow-origin=* \
#   --contracts-console \
#   --http-validate-host=false \
#   --verbose-http-errors \
#   --filter-on=*
