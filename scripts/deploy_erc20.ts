import { ethers } from "hardhat";

async function main() {
  const price = ethers.parseEther("0.001");
  const token = await ethers.deployContract("ZenERC20", [price]);

  await token.waitForDeployment();

  console.log(`Contract deployed to ${token.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});