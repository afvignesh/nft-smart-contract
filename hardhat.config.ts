import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const ALCHEMY_API_KEY = "Enter your Alchemy Key here"
const SEPHOLIA_PRIVATE_KEY = "Enter your Sepholia Private Key here"

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