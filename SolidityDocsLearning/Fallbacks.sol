pragma solidity ^0.5.11;

//  usecase 1: to recieve some ether without specificing any functions.
// usecase 2: "fallback" when we call  some function which doesn't exist then fallback gonna trigger.


contract A {
    
    // declaring a fallback function, it has  no  name, no arguments but it is still possible to send data to fallback function and fallback function can read data using "msg.data"
    // we can declare only one fallback function in one smart contract.
    function() external {
        
    }
}

contract B {
    
    // fallback function accepting ether
    function() payable external {
        
    }
    
    
    A a = new A();
    C(address(a)).doesNotExist();
}

contract C {
    function doesNotExist() external;
}