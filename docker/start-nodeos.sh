#!/bin/bash

set -eox pipefail

# local mode for testing
exec nodeos \
  --http-server-address=0.0.0.0:7777 \
  --enable-stale-production \
  --producer-name=eosio \
  --plugin eosio::chain_api_plugin \
  --plugin eosio::history_api_plugin \
  --plugin=eosio::http_plugin \
  --plugin=eosio::producer_plugin \
  --verbose-http-errors \
  --http-validate-host=false \
  --max-transaction-time=10000 \
  --filter-on=*
