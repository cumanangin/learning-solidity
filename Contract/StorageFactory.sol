//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import "./SimpleStorage.sol";

contract StorageFactory{

    // SimpleStorage public simpleStorage; // dibacanya => sebuah variabel bernama simpleStorage bertipe data SimpleStorage atau analoginya variabel simpleStorage ber-blueprint SimpleStorage.
    SimpleStorage[] public simpleStorageArray; // variabel untuk menampung array, yang bertipe data SimpleStorage
    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage(); // dibacanya => variabel simpleStorage instance atau menjadi hasil dari cetakan SimpleStorage.
        simpleStorageArray.push(simpleStorage);
    } 

    // gimana caranya ambil function store, pada contract lain?

    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public { // kenapa function ini memerlukan uint256 _simpleStorageIndex, uint256 _simpleStorageNumber? Karena memerlukan 2 hal untuk mengkases function pada contract lain
        // Perlu 2 hal, untuk mengakses function dari contract lain :
        // Address
        // ABI (Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex]; // dibacanya => sebuah variable bernama simpleStorage bertipe data SimpleStorage, memiliki nilai simpleStorageArray bertipe data SimpleStorage array. dengan arraynya merupakan parameter inputan
        simpleStorage.store(_simpleStorageNumber); //dibacanya => 
        simpleStorage.store(_simpleStorageNumber);
        // atau bisa juga dengan : 
        // simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.retrieve();
        // ada cara simplenya juga untuk get favorite number
        return simpleStorageArray[_simpleStorageIndex].retrieve(); // kok bisa? karena simpleStorageArray merupakan tipe data contract SimpleStorage, yang artinya juga menyimpan function retrieve.
    }

}