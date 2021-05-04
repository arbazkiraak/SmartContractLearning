pragma solidity ^0.7.6;

/*
Contract can call other contracts in 2 ways.

1. easiest way to is to just call like A.foo(x,y,z)
2. another is using a low level  method "call" // this is not recommened method

*/

contract Callee {
    uint public x;
    uint public value;
    
    function setX(uint _x) public returns (uint){
        x = _x;
        return x;
    }
    
    function setXandSendEther(uint _x) public payable returns (uint,uint){
        x = _x;
        value = msg.value;
        
        return(x,value);
    }
}

// Deploy Callee SC and copy address
// then deploy below Caller

contract Caller {
    function setX(Callee _callee,uint _x) public { // passing SC as input which could reffered as address of SC
        uint x = _callee.setX(_x); // running Callee.setX() function from here
    }
    
    // another way
    function setXFromAddress(address _addr,uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }
    
    // low level way : using call , not recommened
    function setXandSendEther(Callee _callee,uint _x) public payable {
        (uint x,uint value) = _callee.setXandSendEther{value:msg.value}(_x);
    }
}