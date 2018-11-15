'use strict';

const path = require('path');
const ecc = require('eosjs-ecc');
const { green } = require('chalk');
const { api } = require('./config');
const { sendTransaction, getErrorDetail, deployContract } = require('./utils');

module.exports = {
  async createTokenAccount({ account }) {
    const { EOSIO_PRIVATE_KEY } = process.env;
    if (!EOSIO_PRIVATE_KEY)
      throw new Error(
        'process.env.EOSIO_PRIVATE_KEY is not set. Make sure to add it in ".development.env"'
      );
    const EOSIO_PUBLIC_KEY = ecc.privateToPublic(EOSIO_PRIVATE_KEY);
    try {
      await api.rpc.get_account(account);
      console.log(`"${account}" already exists`);
      // no error => account already exists
      return;
    } catch (e) {
      // error => account does not exist yet
    }

    try {
      await sendTransaction([
        {
          account: 'eosio',
          name: 'newaccount',
          actor: 'eosio',
          data: {
            creator: 'eosio',
            name: account,
            owner: {
              threshold: 1,
              keys: [
                {
                  key: EOSIO_PUBLIC_KEY,
                  weight: 1,
                },
              ],
              accounts: [],
              waits: [],
            },
            active: {
              threshold: 1,
              keys: [
                {
                  key: EOSIO_PUBLIC_KEY,
                  weight: 1,
                },
              ],
              accounts: [],
              waits: [],
            },
          },
        },
      ]);
    } catch (error) {
      console.error('Could not creae account: ', getErrorDetail(error));
    }
  },

  async deployTokenContract({ account }) {
    const contractDir = path.join(__dirname, 'build');
    await deployContract({ account, contractDir });
  },

  async createTokenAction({ account, max, symbol }) {
    const name = 'create';
    await sendTransaction({
      account,
      name,
      actor: account,
      data: {
        issuer: 'eosio',
        maximum_supply: `${max} ${symbol}`,
      },
    });
  },
};
