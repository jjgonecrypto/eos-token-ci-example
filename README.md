# EOS Token CI Example

This repo takes the EOSIO.token example and wraps it in a nodejs testing and deployment environment.

> Updated as of EOS **v1.4.3**

> Note: much of this was inspired by the work of @MrToph with his Yeoman generator https://github.com/MrToph/generator-eos

**New to EOS?** [Here's a guide I've put together](./EOSContractDev.md) to get started understanding the EOS ecosystem from a developer's perspective. It includes the various ways to get your local development environment setup

## Local tools required

* EOS (`nodeos` and `keosd`) for running a local EOS node and a local wallet respectively for testing purposes
* `eosio-cpp` from [eosio.cdt](https://github.com/EOSIO/eosio.cdt) for compiling the C++ smart contracts to Web Assembly (WASM)

