import { ethers } from "hardhat";

async function main() {
  const [admin] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", admin.address);

  const contractFactory = await ethers.getContractFactory("SmartBet");
  const smartBet = await contractFactory.deploy();
  await smartBet.waitForDeployment();

  console.log("Contract deployed to:", smartBet.target);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
