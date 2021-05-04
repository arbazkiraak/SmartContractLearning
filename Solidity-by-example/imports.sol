pragma solidity ^0.7.6;

// importing externally.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/cryptography/ECDSA.sol";

import "./Foo.sol";

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();
    
    // Test Foo.sol by getting it's name.
    function getFooName() public view returns (string memory){
        return foo.name();
    }
}