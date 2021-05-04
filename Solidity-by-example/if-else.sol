pragma solidity ^0.7.6;

contract IFelse{
    // pure is same as view function where we are passing  the value to the smart contreact and not modifying anything, just checking or comparing.
    function foo(uint x) public pure returns (uint){
        if (x < 10){
            return 0;
        } else  if (x < 20){
            return  1;
        } else {
            return 2;
        }
    }
}