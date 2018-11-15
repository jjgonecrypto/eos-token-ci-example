'use strict';

const expect = require('chai').expect;
const { api } = require('../config');
const { createTokenAccount, deployTokenContract, createTokenAction } = require('../initializer');

describe('eosio.token', () => {
  jest.setTimeout(20e3);

  const account = 'token.test.1';

  // deploy contract
  beforeAll(async () => {
    await createTokenAccount({ account });
    await deployTokenContract({ account });
  });

  // Nodeos endpoints
  // https://developers.eos.io/eosio-nodeos/reference

  describe('create action', () => {
    const maxSupply = '100';
    const decimals = '000';
    const max = `${maxSupply}.${decimals}`;
    const symbol = 'TEP';
    const reNumDecimals = new RegExp(`\\.0{${decimals.length}}\\s`);

    describe('when created', () => {
      let response;
      beforeAll(async () => {
        await createTokenAction({ account, max, symbol });
        response = (await api.rpc.get_currency_stats(account, symbol))[symbol];
      });

      test('then the currency stats are available', () => {
        expect(response).to.be.an('object');
      });

      test('and the issuer is eosio', () => {
        expect(response.issuer).to.equal('eosio');
      });

      test('and the supply is empty', () => {
        expect(response.supply).to.match(/^0\./);
      });

      test('with the correct number of decimals', () => {
        expect(response.supply).to.match(reNumDecimals);
      });

      test('and the max supply is correct', () => {
        expect(response.max_supply).to.match(new RegExp(`^${maxSupply}\\.`));
      });

      test('with the correct number of decimals', () => {
        expect(response.max_supply).to.match(reNumDecimals);
      });
    });
  });
});
