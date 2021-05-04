pragma solidity ^0.7.6;

contract Counter  {
    uint public count;
    
    // view only function, public to interact , returns int count value
    function get() public view returns (uint){
        return count;
    }
    
    // by default functions have view/edit access
    function inc() public {
        count += 1;
    }
    
    function dec() public {
        count -= 1;
    }
}