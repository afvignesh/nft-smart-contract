# NFT Minter HardHat Project

This project contains smart contract for NFT minter. 
We can find the solidity contract at `contracts\NFTMint.sol`

The project also has support for Makefile. We can deploy our solidity contract to testnet using command
`make deploy`

make sure to add `ALCHEMY_API_KEY` and `SEPHOLIA_PRIVATE_KEY` at hardhat.config.ts

Apart from make we can also use this commands:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
