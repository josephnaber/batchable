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
    event OrderCreated(Order order);
    event OrderRefunded(uint256 _campaignId, address _purchaserAddress, uint8 _quantity);
}


