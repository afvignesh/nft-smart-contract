import { ethers } from "hardhat";

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const creationTime = currentTimestampInSeconds + 60;

  const lock = await ethers.deployContract("NFTMintContract", ["NFT Minter", "TestMint"]);

  await lock.waitForDeployment();

  console.log(
    `Contract deployed to ${lock.target} at ${creationTime}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});