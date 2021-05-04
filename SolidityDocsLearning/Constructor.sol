pragma solidity ^0.5.11;

// constructor executes only once when we deploy our smart contract, good place to do  some intitializations.
// you cannot call a  constructor from function, but constructor can call an functions.

contract MyContract {
    uint a;
    constructor(uint _a) public {
        a = _a;
        // other intialization logic
        foo();
    }
    
    function  foo() public{
        a = 2;
    }
}