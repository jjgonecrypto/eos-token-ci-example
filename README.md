# EOS Token CI Example

[![CircleCI](https://circleci.com/gh/justinjmoses/eos-token-ci-example.svg?style=svg)](https://circleci.com/gh/justinjmoses/eos-token-ci-example)

> Updated as of EOS **v1.4.3**

This repo takes the EOSIO.token example and wraps it in a testing environment that supports nodejs.

> Note: much of this was inspired by the work of @MrToph with his Yeoman generator https://github.com/MrToph/generator-eos

### Related Reading

**New to EOS?** [Here's a guide I've put together](./EOSContractDev.md) to get started understanding the EOS ecosystem from a developer's perspective. It includes the various ways to get your local development environment setup

**Developing tokens yourself?** [Here's a list of gotchas for would-be token developers](./EOSTokenGotchas.md), especially for those coming from Ethereum ERC20 standards.

## Setup

1. Install Docker
1. Pull down the latest CI image (`docker pull justinjmoses/eosio-ci`)
1. Run `git submodule update --init --recursive` to get the contract code

## Write your code and test

1. Change the `eosio.token` files as needed
1. Run `compile-contracts.sh` which puts the `eosio.token` WASM and ABI into `/build`
1. Run `npm run test-with-eos`

## Continuous Integration

- CI is supplied via [CircleCI](./.circleci/config.yml)

## Future work

... deployments!
