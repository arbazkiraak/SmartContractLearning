pragma solidity ^0.5.11;

contract MyContract {
    uint value;
    
    // external = function can be acccessible by outside of the smart contract
    // view = function is read only and not possible to modify.
    // returns = type of datatype function should return
    function getValue() external view returns(uint){
         return value;
    }
    
    // read and write function
    function setValue(uint _value) external {
        value = _value;
    }
}