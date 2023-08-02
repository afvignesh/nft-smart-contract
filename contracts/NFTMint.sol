// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract NFTMintContract is ERC721, Ownable {
    uint256 public totalSupply;
    uint256 public maxSupply;
    uint256 public maxTokenPerWallet = 50;
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
        require(mintedWallets[msg.sender] < maxTokenPerWallet, 'Already reached maximum minting limit per wallet');
        require(maxSupply > totalSupply, 'Already sold out cannot mint');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}