pragma solidity ^0.7.6;

/*
An error will undo all changes made to the state during a transaction.

We can throw error by calling:

1. require - validated inputs,conditions before execution.
2. revert - sim,ilar to require
3. assert - used to check for  code that should never be false, failing  assertion probably means that there is a bug.

*/

contract Error {
    function  testRequire(uint _i) public {
        require(_i > 10,'Input must be greather than 10');
    }
    
    function testRevert(uint _i) public {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public {
        // Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 0);
    }
}