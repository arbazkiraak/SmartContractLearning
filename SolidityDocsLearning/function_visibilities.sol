pragma solidity ^0.5.11;

contract MyContract {
    uint value;
    
    // external = function can be acccessible by outside of the smart contract
    //private =  function can  be accessible by inside smart contract but not ouside.
    // internal = same like private with some extra feature
    // public = function can be call from inside of smart contract aswell as outside. //  can  cause security  issues 
    
    
    // view = function is read only and not possible to modify.
    // returns = type of datatype function should return
    function getValue() private view returns(uint){
         return value;
    }
    
    // read and write function
    function setValue(uint _value) external {
        value = _value;
    }
}