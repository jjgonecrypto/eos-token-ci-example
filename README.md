# EOS Token CI Example

> Updated as of EOS **v1.4.3**

This repo takes the EOSIO.token example and wraps it in a nodejs testing and deployment environment.

> Note: much of this was inspired by the work of @MrToph with his Yeoman generator https://github.com/MrToph/generator-eos

### Related Reading

**New to EOS?** [Here's a guide I've put together](./EOSContractDev.md) to get started understanding the EOS ecosystem from a developer's perspective. It includes the various ways to get your local development environment setup

**Developing tokens yourself?** [Here's a list of gotchas for would-be token developers](./EOSTokenGotchas.md), especially for those coming from Ethereum ERC20 standards.

## Local tools required

* EOS (`nodeos` and `keosd`) for running a local EOS node and a local wallet respectively for testing purposes. Note: while `cleos` will be installed along with the other tools, it isn't necessary for interacting with the local node as we'll use [eosjs](https://github.com/EOSIO/eosjs) for that.
* `eosio-cpp` from [eosio.cdt](https://github.com/EOSIO/eosio.cdt) for compiling the C++ smart contracts to Web Assembly (WASM)

