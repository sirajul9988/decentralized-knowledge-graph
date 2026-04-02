const hre = require("hardhat");

async function main() {
  const Graph = await hre.ethers.getContractFactory("KnowledgeGraph");
  const graph = await Graph.deploy();

  await graph.waitForDeployment();
  console.log("Knowledge Graph deployed to:", await graph.getAddress());

  // Example: Alice (Subject) is (Predicate) a Developer (Object)
  const subject = hre.ethers.id("ALICE_DID");
  const predicate = hre.ethers.id("IS_A");
  const object = hre.ethers.id("DEVELOPER");

  await graph.addTriple(subject, predicate, object);
  console.log("Semantic triple added to the on-chain graph.");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
