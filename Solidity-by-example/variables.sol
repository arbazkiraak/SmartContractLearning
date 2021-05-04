pragma solidity ^0.7.6;

/*
3 TYPES OF VARIABLES:

1. local 
    - declared inside of functions
    - not stored on  the blockchain, its avaiable for temporary until function execution.
2. state
    -  declared outside of function
    - sotred on blockhain
3. global
    - provides information  about the blockchain

*/

contract Variables {
    
    // state variables are stored  on  the  blockchain
    string public text =  "Hello";
    uint public num =  123;
    
    function doSomething() public {
        // local variables
        uint i = 256;
    }
    
    // here are some global variables;
    
    uint timestamp = block.timestamp; //  current  block timestamp
    address sender = msg.sender; //  address of the caller.
}