pragma solidity ^0.7.6;

/*

Solidity supports multiple inheritance. Contracts can inherit other contract by using the "is" keyword.
Function that is going to be overridden by a child contract must be declared as "virtual".
Function that is going to override a parent function must use the keyword "override".
You have to list the parent contracts in the order from “most base-like” to “most derived”.
*/

//  https://www.youtube.com/watch?v=GnztHR8-1o8
// https://www.youtube.com/watch?v=Q5_Gmm_IZSI

contract A {
    function getContractName() public pure returns (string memory){
        return "Contract A";
    }
}

contract B is A{
    // now B can access  all properties,functions of contract A
    // getContractName() // would execute  A.getContractName() which would return :"Contract A"
    
    // in order to override getContractName() function, we can use  override keyword
    function getContractName() public pure virtual override returns (string memory){
        return "Contract B";
    }
}