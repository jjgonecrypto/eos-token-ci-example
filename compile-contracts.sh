#!/bin/bash

set -eox pipefail

mkdir -p build;
pushd build;
# running this outside of the same folder where the WASM is generated seems to not generate a correct ABI
# https://github.com/EOSIO/eosio.cdt/issues/281
eosio-cpp ../eosio.contracts/eosio.token/src/eosio.token.cpp -I ../eosio.contracts/eosio.token/include/ -o eosio.token.wasm --abigen || popd
