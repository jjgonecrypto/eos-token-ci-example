'use strict';

const { createTokenAccount, deployTokenContract, createTokenAction } = require('../initializer');

describe('contract', () => {
  jest.setTimeout(20e3);
  // create account via eosio
  // what if the account exists?

  const account = 'token.test.1';

  // deploy contract
  beforeAll(async () => {
    await createTokenAccount({ account });
    await deployTokenContract({ account });
    await createTokenAction({ account, max: '100.000', symbol: 'TEST' });
  });

  test('something', async () => {
    expect(true).toBe(true);
  });
  test('else', async () => {
    expect(true).toBe(true);
  });
  test('altogether', async () => {
    expect(true).toBe(true);
  });
});
