pragma solidity ^0.7.6;

contract SimpleStorage {
    
    // state variable
    uint public num;
    
    function set(uint _num) public {
        // setting state  variable by taking input from blockchain when deployed
        num = _num;
    }
    
    // read only function
    function get() public view returns(uint){
        return num;
    }
}