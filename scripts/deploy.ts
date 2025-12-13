
import { ethers } from "hardhat";

async function main() {
  const Lottery = await ethers.getContractFactory("BaseLottery");
  const lottery = await Lottery.deploy(ethers.parseEther("0.001"));
  await lottery.waitForDeployment();

  console.log("Lottery deployed to:", await lottery.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
