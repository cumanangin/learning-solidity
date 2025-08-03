// we want to able to : 
// get funds for user
// withdraw funds
// set a minimum funding value in USD

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 minimumUsd = 0.5 * 1e18; // 1 * 10 ** 18

    address[] public funders;

    mapping(address => uint256) public amountToFunded;

    function fund() public payable{ // mark the function with payable. means we can access the value attribute
    // payable gunanya agar functio payable dengan ethereum atau native blockchain currency

        // Want to be able to set a minimum func amount in USD
        // 1. How do we send ETH to this contract? 

        // msg.value; // msg.value untuk mengakses atribut value
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't have enough eth!"); // untuk memastikan msg.value lebih dari 1e18 == 1 * 10 ** 18 = 1000000000000000000 Wei = 1 eth
        funders.push(msg.sender);
        amountToFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns (uint256){
        // ABI
        // Address = 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
        //3439.21767037.0000000000
    }

    function getVersion () public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint ethPriceInUsd = (ethAmount * ethPrice) / 1e18;
        return ethPriceInUsd;
    }
}