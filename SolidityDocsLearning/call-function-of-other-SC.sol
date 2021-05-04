pragma solidity ^0.5.11;

contract A {
    address addressB;
    // setting address of B smartcontract in addressB above
    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }
    
    function callHelloWorld() external view returns(string memory){
        B bname = B(addressB); // accessing B smart contract address
        return bname.helloWorld();
    }
    
    
}

contract B {
    function helloWorld() external pure returns(string memory){
        return 'Hello  World';
    }
}


// first deploy B smart contract.
// then copy the B smart contract address./
// paste  it in setAddressB(0x.....) argument.
// now addressB variable has the address of B smart contract,
// just run helloWorld() function.