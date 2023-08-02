const { expect } = require('chai')
const { ethers } = require('hardhat')

describe("NFTMintContract contract", function (){

    let nftContract;
    let owner;
    let addr1;
    let contractFactory; 
    beforeEach(async function() {
        [owner, addr1] = await ethers.getSigners();

        contractFactory = await ethers.getContractFactory("NFTMintContract")
        nftContract = await contractFactory.deploy("test", "Mint")

    })

    it("Should update totalSupply when minting", async function () {
       
        expect(await nftContract.maxSupply()).to.equal(1000)
        expect(await nftContract.totalSupply()).to.equal(0)

        await nftContract.mint()

        expect(await nftContract.totalSupply()).to.equal(1)

    })

    it("Should be able to update maxSupply", async function () {
        await nftContract.setMaxSupply(1)
        expect(await nftContract.maxSupply()).to.equal(1)
    })

    it("Should be able to update MaxTokenPerWallet", async function () {
        await nftContract.setMaxTokenPerWallet(1)
        expect(await nftContract.maxTokenPerWallet()).to.equal(1)
    })

    it("Should be able to update isMintable", async function () {
        await nftContract.toggleMintable()
        expect(await nftContract.isMintable()).to.equal(false)

        await nftContract.toggleMintable()
        expect(await nftContract.isMintable()).to.equal(true)
    })

})