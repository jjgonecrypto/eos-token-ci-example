# Gotchas with EOS token development

1. You need RAM (~3k) to create new user accounts in EOS. You also need to stake some EOS for CPU and Network.
1. There is no `ERC20` token standard as such. Instead, token developers are expected to customize the `eosio.token` [standard](https://github.com/EOSIO/eosio.contracts/tree/master/eosio.token) (see https://ylv.io/differences-between-erc-20/)
1. Transferring a token to others will cost the sender a small amount of RAM (~ 250 bytes, depending on how much is stored for the user) if the recipient does not have any of that token yet. This is because the first time the user receives a token, an entry has to be made in the `accounts` table for them.
1. The decimal places used on token creation will dictate how many are used. See https://github.com/EOSIO/eos/issues/2322#issuecomment-380669709
1. The `eosio.token` contract allows for multiple tokens to be create from the one smart contract. Each time the `create` action is called, the symbol is checked for existance in the `stat` table, and if no record, it is added.
1. All state is stored in tables (and when added to increases the `RAM` used). So instead of sharing state between contract deployment to usage - as say with a constructor in Solidity - data must be stored in RAM and objects created in each action at invocation.
1. You can only have one source file. As a workaround, you can either put logic into other header files, or even include other CPP files in the header. Both aren't a C++ standard. See https://eosio.stackexchange.com/questions/1334/how-to-correctly-include-multiple-cpp-files-in-eosiocpp-o/1349#1349
