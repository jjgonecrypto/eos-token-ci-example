#!/bin/bash

set -eox pipefail

mkdir -p build

# run a container to compile
docker run \
--rm \
--mount type=bind,source="$(pwd)"/eosio.contracts/eosio.token,destination=/eosio.token \
--mount type=bind,source="$(pwd)"/build,destination=/build \
 justinjmoses/eosio-ci \
 /bin/bash -c "cd /build && eosio-cpp /eosio.token/src/eosio.token.cpp -I /eosio.token/include/ -o eosio.token.wasm --abigen"
