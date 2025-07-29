//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage{

    // type data in solidity 
    // uint256
    // string
    // bool
    // address
    // bytes32
    
    // Terdapat 2 tipe pada suatu function getter , view dan pure.
    // Tetapi sebenarnya, yang bisa digunakan untuk function getter, hanya view saja.
    
    // Function dengan tipe view memiliki karakteristik seperti ini.
        // Bisa mengakses global variable
        // Bisa mengubah global variable
        // Bisa digunakan untuk mengembalikan private/public variable

    // Sementara itu function dengan tipe pure.

        // Tidak bisa mengakses/mengubah global variable sama sekali
        // Hanya bisa melakukan aksi terhadap variable lokal di dalam function maupun variable parameter function
        // Tidak bisa mengembalikan global variable

    // Contoh function view
    // uint256 public x= 3;
    // function exampleView(uint256 y) public view returns (uint256) {
    //     return x + y;
    // }

    // // Contoh function pure 
    // function examplePure(uint256 a, uint256 b) public pure returns (uint256) {
    //     return a + b;
    // }

    uint256 public favoriteNumber;
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    mapping(string => uint256) public nameToAge;

    string personName;

    // buat data
    function setPersonName(string memory _personName) public{
        personName = _personName;
    } 

    // get data
    function getPersonName() public view returns (string memory){
        return personName;
    }
    
    // like class in OOP Java
    struct People{
        string name;
        uint256 age;
    }

    // Array Solidity
    People[] public person;

    // push data into an Array
    function addPerson(string memory _name, uint256 _age) public {
        person.push(People({name: _name, age: _age}));
        nameToAge[_name] = _age;
    }

    // Get data from Array
    function getPerson() public view returns(People[] memory){
        return person;
    }  

    struct PeopleFavNumber{
        string peopleName;
        uint256 favNumber;
    }

    mapping(uint256 => string) public favNumberToName;
    PeopleFavNumber[] public personal;

    function addPersonal(string memory _peopleName, uint256 _favNumber)public{
        personal.push(PeopleFavNumber({peopleName: _peopleName, favNumber: _favNumber}));
        favNumberToName[_favNumber] = _peopleName;
    }

    function getPersonal() public view returns(PeopleFavNumber[] memory){
        return personal;
    }
}