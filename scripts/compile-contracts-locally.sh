#!/bin/bash

set -eox pipefail

eosio-cpp eosio.contracts/eosio.token/src/eosio.token.cpp \
  -I eosio.contracts/eosio.token/include/ \
  -o build/eosio.token.wasm \
  --abigen \
  -contract=eosio.token
