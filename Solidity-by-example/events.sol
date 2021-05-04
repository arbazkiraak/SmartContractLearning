pragma solidity ^0.7.6;

/*
Events allow logging to  eth blockchain:
1. it passses info to frontend who is lisitng for  events  and updating user interface at frontefrontend
2. a cheap form  of storage
*/

contract Event {
    // event declaration, upto 3 parameters can be indexed, indexed paramters helps you filter the logs
    event Log(address indexed sender,string message);
    event AnotherLog();
    
    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}