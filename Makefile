#!make

deploy:
	npx hardhat compile
	npx hardhat test
	npx hardhat run scripts/deploy.ts --network sepolia