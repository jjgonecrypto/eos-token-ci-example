#!/bin/bash

set -eox pipefail

# this will also remove the containers as they were started with the --rm flag
docker ps --last 2 --filter "ancestor=justinjmoses/eosio-ci" -q | xargs 'docker' 'stop' '-t=1'
