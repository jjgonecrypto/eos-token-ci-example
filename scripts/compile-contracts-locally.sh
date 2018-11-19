#!/bin/bash

set -eox pipefail

# get parent dir of this script file
ROOT_PATH=$(printf '%q' "$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)")

SCRIPT_CONTENTS=$(eval "$ROOT_PATH/scripts/generate-contract-compile-cmd.sh")

echo "Running:"
echo "$SCRIPT_CONTENTS"

eval "$SCRIPT_CONTENTS"
