// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract Batchable{
	constructor(){}

struct Batch {
        uint256 id;
        address creator; // msg.sender
        address nftContractAddress;
        bool paused; // this can pause and unpause the addition of paid 
spots for this batch
        bool minted; // this means it is complete and the NFTs have been 
minted
        string externalId; // external id of the batch
        uint8 fee; // % of premint sale amount that gets paid to this 
contract
        uint256 price; // cost to premint
        uint256 maxSpots; // max number of spots available on this batch
        uint256 spotsTaken; // number of spots taken on this batch
        uint256 spotsPerWallet; // number of paidSpots spots available per 
wallet
        uint256 batchBalance; // amount of wei paid to this batch
    }

    struct Spot {
        uint256 batchId;
        address purchaserAddress;
        uint8 quantity;
        uint256 spotsTakenTotal; // The new value of taken spots after 
this spot is added
        uint256 spotsTakenByWallet; // The new value of taken spots by 
this address after this spot is added
        string externalId; // same value as the batch external id
    }

    event BatchCreated(Batch batch);
    event SpotReserved(Spot spot);
    event RefundRequested(Spot spot);
}
