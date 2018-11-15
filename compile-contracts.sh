#!/bin/bash

set -eox pipefail

mkdir -p build;
pushd build;
eosio-cpp ../eosio.contracts/eosio.token/src/eosio.token.cpp -I ../eosio.contracts/eosio.token/include/ -o eosio.token.wasm --abigen || popd
