pragma solidity ^0.7.6;

/*

Functions and state variables have to declare whether they are accessible by other contracts.

* State variables can be declared as public, private, or internal but not external.
* Functions can be declared as public,private,internal,external.

1. public  -  can be called inside of  this contract,inside contracts that inherit this contract,other  contracts
2. private -  can be called only inside the contract that defines the function
3. internal -  can be called only inside contract that inherits an internal function
4. external - external functions can only be called by other contracts and accounts.

*/

contract Base {
    
    // public functions can be called inside of this contract,inside contracts that inherit this contract, by other contracts and accounts.
    function publicFunc() public pure returns (string memory){
        return "public function called";
    }
    
    // external functions can only be called by other contracts and accounts.
    function externalFunc() external pure returns (string memory){
        return "External function called";
    }
    
    
    
    // private function can only be called inside this "Base" contract, Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns (string memory){
        return "private function called!";
    }
    
    // this will run since it is called inside "Base" contract
    function  testPrivateFunc() public pure returns (string memory){
        return privateFunc();
    }
    
    
    // internal functions can only be  called inside this "Base" contract, Inside contracts that inherit this contract
    
    function internalFunc() internal pure returns (string memory){
        return "internal function called!";
    }
    
    function testInternalFunc() public pure virtual returns (string memory){
        return internalFunc();
    }
    
    
}


// inheriting Base in child
contract Child is Base {
    // Inherited contracts do not have access to private functions and state variables.
    
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }
    
    // Internal function call be called inside child contracts.
    function testInternalFunc() public pure virtual override returns (string memory){
        return internalFunc();
    }
    
}