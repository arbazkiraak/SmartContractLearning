pragma solidity ^0.7.6;

/*
You can interact with (other contracts functions/variables) by declaring an Interface.

1. cannot have any functions implemented
2. can inherit from other interfaces
3. all declared functions must be external
4. cannot declare a constructor
5. cannot declare state variables

*/
// https://www.youtube.com/watch?v=YWtT0MNHYhQ

contract Counter {
    uint public count;
    
    function increment() public {
        count += 1;
    }
}

// Now deploy and `Counter` SC, and copy the address of the contract.

interface ICounter {
    function count() external view returns (uint); // this is  to read public `count` variable value.
    function increment() external; // this is to  call `Counter.increment()`
}


contract MyContract {
    function incrementCounter(address _counter) external {  // it gonna take input as address of `Counter` SC.
        ICounter(_counter).increment(); // gonna run increment() function on the address of `Counter` SC.
    }
    
    function getCount(address _counter) external view returns (uint){
        return ICounter(_counter).count();
    }
}