pragma solidity ^0.5.11;

contract MyContract {
    // 1. storage 
    // 2. memory
    // 3. stack
    // 4. calldata

    // 1. storage: which stored permanently on blockchain and has memory,  usually  decalred outside of functions,  ex:
    uint a;
    
    struct User {
        string name;
    }
    
    User[] users;
    
    function foo() external {
        User storage user = users[0];  // we can do users[0].name aswell, but here  we are accessing it  via storage "memoery location"
        User.name = 'whatever you want';
        
        
        bar(user); //  calling below bar function along with user as argument
    }
    
    function bar(User memory user) internal { // can be called inside of smart contract only,
        // do something
    }
    
    function stack() external {
        uint b; //  since it's decalred inside of  function, it's stored in temporary memory and available until the execution only, it's gone after execution.
    }
    
    function fooa(unit[] calldata _usersss) external { // when we pass arrayas input argument on external function, mention "callback"
        uint  b;
    }
    
}