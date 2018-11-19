#!/bin/bash

set -eo pipefail

function generate_command() {
  echo "eosio-cpp $1eosio.contracts/eosio.token/src/eosio.token.cpp \
  -I $1eosio.contracts/eosio.token/include/ \
  -o $1build/eosio.token.wasm \
  --abigen \
  -contract=eosio.token" | xargs # xargs to trim spaces
}

prefix_path=

while getopts ":thp:" opt; do
  case ${opt} in
    p )
      prefix_path=$OPTARG
      ;;
    h )
      cat << EOF
Compile EOS contract or output code to do so.

OPTIONS:
    -p      [Optional] Prefix path to contracts
    -h      Show this message

EOF
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
    * )
      echo "- Invalid option $OPTARG" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

echo $(generate_command "$prefix_path")
