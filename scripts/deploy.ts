import { ethers } from "hardhat";

async function main() {
  // Get the admin account from the Hardhat node
  const [admin] = await ethers.getSigners();

  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const lockedAmount = ethers.parseEther("0.001");

  const lock = await ethers.deployContract("SmartBet", [unlockTime], {
    value: lockedAmount,
  });

  await lock.waitForDeployment();

  console.log("SmartBet deployed to:", lock.address);
  console.log("Admin address:", admin.address);
  console.log(
    `Lock with ${ethers.formatEther(
      lockedAmount
    )}ETH and unlock timestamp ${unlockTime} deployed to ${lock.target}`
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
