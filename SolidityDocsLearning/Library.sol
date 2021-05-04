pragma solidity ^0.5.11;

library MyLibrary {
    function add10(uint a)pure public returns(uint){
        return a + 10;
    }
}

contract MyContract {
    function foo() external {
        uint result = MyLibrary.add10(10);
    }
}