// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(getConvertion(msg.value) >= minimumUsd, "Didn't send enough. Current amount send");
    }

    function getPrice() public view returns (uint256) {
        // ABI
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000_00000000
        return uint256(price * 1e10);
    }


    function getConvertion(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();

        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

}