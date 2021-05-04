pragma solidity ^0.7.6;

/*
Modifiers are code that run before or after a function  call.
they are  used to check restrict access,validate input and guard agains reentrancy hacks

same like django signals where we make some access control checks on views
*/

contract FunctionModifier {
    
    address public owner;
    uint public x = 10;
    bool public locked; //default false
    
    // it runs first when smart contract executes, for intialization
    constructor(){
        // set the transaction sender as  owner of the contract
        owner =  msg.sender;
    }
    
    // to check if caller is the owner of the contract
    modifier onlyOwner(){
        require(msg.sender == owner,"Not owner");
        _; // every modifier should contain _ at  the end whioch instruct the solidity to execute  the rest of the code of the function
    }
    
    modifier validAddress(address _addr){
        require(_addr != address(0),"Not valid address"); // address passed in is not the zero address.
        _;
    }
    
    // this function only executes if it passes both modifiers
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
        owner  = _newOwner;
    }
    
    
    // Modifiers can be called before/or after a function/
    // This modifier prevents a  function from being called  while  it is still executing.
    
    modifier noReentrancy() {
        require(!locked,"No reentrancy");
        locked = true;
        _; // after executing rest of  function  code, make locked to false below
        locked = false;
    }
    
    function decrement(uint i) public noReentrancy {
        x -= i;
        if (i > 1){
            decrement(i - 1);
        }
    }
    
}