# Decentralized Knowledge Graph (Identity-linked)

A professional-grade infrastructure for structured data on the blockchain. This repository enables the creation of "Triples" (Subject-Predicate-Object) that are signed by Decentralized Identities (DIDs). This allows for the construction of a global, permissionless database where every piece of information is attributed to a verified source.

## Core Features
* **Semantic Linking:** Connects disparate data points through standardized RDF-like structures.
* **DID Integration:** Each node and edge in the graph is linked to a unique, self-sovereign identity.
* **Attestation Engine:** Allows entities to "vouch" for the validity of data within the graph.
* **Flat Architecture:** Single-directory layout for the Graph Registry and the Attestation Logic.

## Workflow
1. **Node Creation:** Register a new entity (e.g., a person, a product, or an AI model).
2. **Edge Definition:** Define a relationship between two nodes (e.g., "Person A" -> "Owns" -> "Product B").
3. **Verify:** Third parties check the signatures to verify the source of the claim.
4. **Query:** Traverse the on-chain graph to find relationships and trust scores.

## Setup
1. `npm install`
2. Deploy `KnowledgeGraph.sol`.
