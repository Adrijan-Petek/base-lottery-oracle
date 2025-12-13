
import { ethers } from "hardhat";

async function main() {
  const address = process.env.LOTTERY_ADDRESS!;
  const lottery = await ethers.getContractAt("BaseLottery", address);

  const tx = await lottery.drawWinner();
  await tx.wait();

  console.log("Winner drawn");
}

main().catch(console.error);
