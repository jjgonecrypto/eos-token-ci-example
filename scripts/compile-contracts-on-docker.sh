#!/bin/bash

set -eo pipefail

# get parent dir of this script file
ROOT_PATH=$(printf '%q' "$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)")

SCRIPT_CONTENTS=$(eval "$ROOT_PATH/scripts/generate-contract-compile-cmd.sh -p /")

echo "Attempting to run the following on docker:"
echo "$SCRIPT_CONTENTS"

# Note below: duping the dirname call to prevent issues with bash escaping spaces in the source path
docker run \
--rm \
--mount type=bind,source="$(cd "$( dirname "${BASH_SOURCE[0]}" )/../eosio.contracts" && pwd)",destination="/eosio.contracts" \
--mount type=bind,source="$(cd "$( dirname "${BASH_SOURCE[0]}" )/../build" && pwd)",destination="/build" \
 justinjmoses/eosio-ci \
 /bin/bash -c "$SCRIPT_CONTENTS"
