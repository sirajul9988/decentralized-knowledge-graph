// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title KnowledgeGraph
 * @dev Stores Subject-Predicate-Object triples linked to DIDs.
 */
contract KnowledgeGraph is Ownable {
    struct Triple {
        bytes32 subject;
        bytes32 predicate;
        bytes32 object;
        address creator;
        uint256 timestamp;
    }

    // Mapping from Triple Hash to the Triple data
    mapping(bytes32 => Triple) public graph;
    
    // Mapping to track attestations (trust) for specific triples
    mapping(bytes32 => address[]) public attestations;

    event TripleAdded(bytes32 indexed tripleId, bytes32 subject, bytes32 predicate);
    event Attested(bytes32 indexed tripleId, address indexed witness);

    constructor() Ownable(msg.sender) {}

    /**
     * @dev Adds a new piece of information to the graph.
     */
    function addTriple(bytes32 _s, bytes32 _p, bytes32 _o) external returns (bytes32) {
        bytes32 tripleId = keccak256(abi.encodePacked(_s, _p, _o));
        require(graph[tripleId].creator == address(0), "Triple already exists");

        graph[tripleId] = Triple({
            subject: _s,
            predicate: _p,
            object: _o,
            creator: msg.sender,
            timestamp: block.timestamp
        });

        emit TripleAdded(tripleId, _s, _p);
        return tripleId;
    }

    /**
     * @dev Vouch for the accuracy of a triple.
     */
    function attest(bytes32 _tripleId) external {
        require(graph[_tripleId].creator != address(0), "Triple does not exist");
        attestations[_tripleId].push(msg.sender);
        emit Attested(_tripleId, msg.sender);
    }

    function getAttestationCount(bytes32 _tripleId) external view returns (uint256) {
        return attestations[_tripleId].length;
    }
}
