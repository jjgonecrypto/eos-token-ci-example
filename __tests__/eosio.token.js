'use strict';

// const { sendTransaction } = require('../utils');

// const { CONTRACT_ACCOUNT } = process.env;
const { createTokenAccount, deployTokenContract } = require('../initializer');

describe('contract', () => {
  jest.setTimeout(20e3);
  // create account via eosio
  // what if the account exists?

  const account = 'token.test.1';

  // deploy contract
  beforeAll(async () => {
    await createTokenAccount({ account });
    await deployTokenContract({ account });
  });

  test('something', async () => {
    expect(true).toBe(true);
  });
  test('else', async () => {
    expect(true).toBe(true);
  });
});
