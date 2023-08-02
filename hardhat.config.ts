import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const ALCHEMY_API_KEY = "QVzr4gu4c89XZYTjGiMnfwUZYkQJaFQt"
const SEPHOLIA_PRIVATE_KEY = "2c42fd4833e35969d94038817df5fe88f71a0fce183c4a924a6bb0a69c2e935e"

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [SEPHOLIA_PRIVATE_KEY]
    }
  }
};

export default config;