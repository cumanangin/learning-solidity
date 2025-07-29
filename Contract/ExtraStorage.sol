//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{ // maksudnya ialah, akan inheritance atau mewarisi semua variabel dari contract SimpleStorage
    // override
    // melakukan override, perlu 2 hal : virtual dan override

    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }
}