

FROM ubuntu:18.04

LABEL author="Justin J. Moses <justinjmoses@gmail.com>" version=$version \
  description="This is a base image for CI tooling to test EOS smart contracts"

ARG version=1.4.3
ARG cdt_version=1.4.1

# prepare the package manager
RUN apt-get update
RUN apt-get install -y wget

# get requirements for EOS itself (libssl) and CircleCI (https://circleci.com/docs/2.0/custom-images/#required-tools-for-primary-containers)
RUN apt-get -y install openssl ca-certificates git ssh

# install EOS to get nodeos and keosd
RUN wget https://github.com/eosio/eos/releases/download/v${version}/eosio-${version}.ubuntu-18.04-x86_64.deb
RUN apt-get install -y ./eosio-${version}.ubuntu-18.04-x86_64.deb

# install eosio.cdt to get the eosio-cpp compiler
RUN wget https://github.com/eosio/eosio.cdt/releases/download/v${cdt_version}/eosio.cdt-${cdt_version}.x86_64.deb
RUN apt-get install -y ./eosio.cdt-${cdt_version}.x86_64.deb

# copy local startup config files
COPY start-keosd.sh /start-keosd.sh
COPY start-nodeos.sh /start-nodeos.sh
