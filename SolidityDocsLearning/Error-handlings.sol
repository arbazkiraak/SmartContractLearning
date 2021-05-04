pragma solidity ^0.5.11;

contract  MyContract {
    
    // whenever error happens in solidity in middle of something, solidity gonna revert the chnages happens before the error. like if variable value changed then it gonna set initial value of that variable.
    // but gas is gonna consume, there's no revert in gas
    
    
    // throw = thows a  error 
    // revert() = thorws a error
    // require() = throws a error
    // assert() = thorws a error
    
    uint a =  10;
    function  foo() external {
        // something
        if(a != 10){
            revert("reverting because a condition match failed");
        }
        
        require(a != 10,'revering because a condition failed'); // short version of revert in one line.
        assert(a != 10); 
    }
}