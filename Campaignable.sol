// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract Campaignable{
	constructor(){}

    struct Campaign {
        address creator;
        address paymentAddress;
        bool paused;
        bool minted;
        string externalId;
        uint8 fee;
        uint256 price;
        uint256 maxOrders;
        uint256 ordersTotal;
        uint256 ordersPerWallet;
        uint256 campaignBalance;
        uint256 id;
    }

    struct Order {
        address purchaserAddress;
        string externalId;
        uint8 quantity;
        uint256 campaignId;
        uint256 campaignOrdersTotal;
        uint256 walletOrdersTotal;
    }

    event CampaignCreated(Campaign campaign);
    event OrderCreated(Order createdOrder);
    event OrderRefunded(Order refundedOrder);

    modifier isValidCreate(bytes memory _signature, string memory _campaignId, uint8 _fee, address _contractAddress){
        bytes32 messageHash = keccak256(
            abi.encodePacked(_contractAddress, msg.sender, _campaignId, "create", _fee)
        );
        address signer = messageHash.toEthSignedMessageHash().recover(
            _signature
        );
        require(signer == authorizerAddress, "Invalid signature");
        _;
    }
}


