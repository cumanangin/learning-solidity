// we want to able to : 
// get funds for user
// withdraw funds
// set a minimum funding value in USD

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract FundMe{

    function fund() public payable{ // mark the function with payable. means we can access the value attribute
    // payable gunanya agar functio payable dengan ethereum atau native blockchain currency

        // Want to be able to set a minimum func amount in USD
        // 1. How do we send ETH to this contract? 

        // msg.value; // msg.value untuk mengakses atribut value
        require(msg.value > 1e18, "Didn't send enought!"); // untuk memastikan msg.value lebih dari 1e18 == 1 * 10 ** 18 = 1000000000000000000 Wei = 1 eth
    }
}