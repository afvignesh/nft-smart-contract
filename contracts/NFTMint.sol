// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract NFTMintContract is ERC721, Ownable {
    uint256 public totalSupply; // the current amount of NFTs Minted
    uint256 public maxSupply; // the maximum amount of NFTs that can be Minted
    uint256 public maxTokenPerWallet = 50; // the maximum amount of token allowed per wallet
    bool public isMintable = true;
    mapping(address => uint256) public mintedWallets; 

    constructor(
        string memory name,
        string memory symbol
    ) payable ERC721(name, symbol) {
        maxSupply = 1000;
    }

    function toggleMintable() external onlyOwner {
        isMintable = !isMintable;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function setMaxTokenPerWallet(uint256 maxTokenPerWallet_) external onlyOwner {
        maxTokenPerWallet = maxTokenPerWallet_;
    }

    function mint() external payable {
        require(isMintable, 'Minting is disabled at the moment');
        // If user already reached above permissible limit
        // Then stop him/her from minting ...
        require(mintedWallets[msg.sender] < maxTokenPerWallet, 'Already reached maximum minting limit per wallet');

        // If already above max limit 
        // Then stop user from minting ... 
        require(maxSupply > totalSupply, 'Already sold out cannot mint');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}