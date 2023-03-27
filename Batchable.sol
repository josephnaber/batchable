// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract Batchable{
	constructor(){}

struct Batch {
        uint256 id;
        address creator;
        address nftContractAddress;
        bool paused;
        bool minted;
        string externalId;
        uint8 fee;
        uint256 price;
        uint256 maxSpots;
        uint256 spotsTaken;
        uint256 spotsPerWallet;
        uint256 batchBalance;
    }

    struct Spot {
        uint256 batchId;
        address purchaserAddress;
        uint8 quantity;
        uint256 spotsTakenTotal;
        uint256 spotsTakenByWallet;
        string externalId;
    }

    event BatchCreated(Batch batch);
    event SpotReserved(Spot spot);
    event RefundRequested(uint _batchId, address _purchaserAddress, uint _quantity);
}
