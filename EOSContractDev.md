# Getting started writing Smart Contracts with EOS

This information has been extrapolated from https://developers.eos.io/eosio-home/docs

Latest version of EOS when writing: `1.4.0`

> Note: the Developer Portal has a number of older links inside it. Some of the URLs contain older version numbers. For example, if you use the breadcrumbs at the top, things can get confusing as the latest version shows as v1.3.0 which has different C++ syntax due to the latest changes in `eosio.cdt` )Contract Development Toolkit)  https://developers.eos.io/eosio-cpp/v1.3.0/docs/introduction-to-smart-contracts

## Environment Setup

### Cleos - the tool for interacting with an EOS blockchain
At a bare minimum, you will need `cleos`.

`cleos` is the CLI tool for reading and writing to an EOS blockchain (connecting to some local or remote `nodeos` instance). It also can talk to a wallet provider - `keosd`, which can also be local or remote. `cleos` communicates over REST requests.

You get `cleos` bundled in when you install the EOS blockchain (see below).

### Installing EOS blockchain
Installing the EOS blockchain locally will expose tools `nodeos`, `keosd` and `cleos`.

You can either install them via package managers ([see instructions via GitHub](https://github.com/EOSIO/eos)) or using Docker ([this is the preferred way](https://developers.eos.io/eosio-home/docs/getting-the-software) in the dev portal docs). If you use a package manager, all three tools will appear on your `PATH`, otherwise they will all be hidden inside a Docker container.

The advantage of running via Docker, is being able to run both `nodeos` and `kleos` within a container, expose them via a couple of ports, start and stop whenever you need, and run `cleos` by reaching into the container and invoking it. All the docs in the portal also refer to using Docker and have the right configuration to get the instance running.

### Installing C++ helper tools
In order to easily compile your smart contracts written in C++ to Web Assembly (WASM) that will run in EOS, there are some helpful tools, in particular `eosio-cpp`, which comes with `eosio.cdt` - the [EOS Contract Development Toolkit](https://github.com/EOSIO/eosio.cdt).

The guides used to recommend building the CDT from source, but now it's easy enough with homebrew on a MAC.

Once installed, a number of `eosio-` prefixed tools are available on your PATH, as well as a slew of EOS C++ libraries under `/usr/local`. `eosio-cpp` is the main tool exposed, which basically runs the `clang` C++ compiler with a number of WASM flags.

## Example Contracts
There are contracts in the EOS repo: https://github.com/EOSIO/eos/tree/master/contracts However, these don't seem to be kept up to date with the latest from `eosio.cdt`.

The best list of example contracts are kept in the `eosio.contracts` repo: https://github.com/EOSIO/eosio.contracts/

## Interacting with an EOS Blockchain
`cleos` needs to be run with `--url ...` option, to point to the local or remote `nodeos` instance you want to interface with.

* If running against the local Docker instance, then you'd use `--url http://127.0.0.1:7777`.
* If running against the Jungle testnet, you could use `--url https://api.jungle.alohaeos.com:443`
* If running against the Kylin testnet, you could use `--url https://api.jungle.alohakylin.com:443`
* If running against mainnet, you could use `--url https://api.main.alohaeos.com:443`

All the below examples omit the `--url` parameter, presuming you add it with the destination of your choosing.

## Creating new accounts
When creating an account against a local `nodeos` deployment, you can run `cleos create account`. However this will fail on a testnet or mainnet as the account will have no RAM. You need to use `cleos system newaccount`, buy RAM and stake EOS for CPU & Network.

E.g. `cleos system newaccount --stake-net "2 EOS" --stake-cpu "2 EOS" --buy-ram "2 EOS" [creator] [name] [OwnerPubKey]`

### Transferring EOS

`cleos transfer [sender] [recipient] [amount] [memo]`

e.g. `cleos transfer account11111 account22222 "0.0001 EOS" "memo text"`

### Publishing a Contract

1. Create an account to deploy as (assuming `cleos wallet unlock`)

    `cleos create account [creator: eosio] [account] $PUBKEY`

1. Write contract code in C++ (or C?)

2. Compile with `eosio-cpp` (with eosio-cc for C?)

    `eosio-cpp -I include -o [target].wasm [source].cpp --abigen`

3. Broadcast the WASM to the blockchain with `cleos set contract`

    `cleos set contract [account] [contract-dir]`

    > Note: `contract-dir` needs to be a matching path in the Docker container (if using Docker), otherwise you will get not found errors for the WASM file.

    > Note: you can push new versions of the same contract the same way (qu: how does this work?)

### Interacting with the contract's actions

`cleos push action [account] [action] '[data]' -p [user]@active`

e.g. `cleos push action eoisio.token issue '[ "alice", "100.0000 SYS", "memo" ]' - eosio@active`

### Getting token information

Get the statistics about a token (that was published under the account `contract`)
`cleos get currency stats [contract] [symbol]`

e.g. `cleos get currency stats eosio.token SYS`

> This is the same as running `cleos get table eosio.token SYS stat`

And get an individual's ownership of that token (that was published under the account `contract`)
`cleos get currency balance [contract] [account]`

e.g. `cleos get currency balance eosio.token someusername`

> This is the same as running `cleos get table eosio.token someusername accounts`
