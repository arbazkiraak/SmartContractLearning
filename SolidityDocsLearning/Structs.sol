pragma solidity ^0.5.11;

contract MyContract {
    // declare struct 
    
    struct User {
        address addr;
        uint score;
        string name;
    }
    
    //array of struct 
    
    User[] users;
    
    // mapping of struct 
    
    mapping(address => User) userList;
    
    //////
    
    function foo(string calldata _name) external {
        User memory user1 = User(msg.sender,0,_name);
        User memory user2 = User(msg.sender,0,_name);
        User memory user3 = User({name: _name,score: 0,addr: msg.sender}); // another way to define
        
        user3.addr; // accessing the fields
        user3.score = 100; // updating the fields
        delete user1; // delete object
        
        
        // array of struct pushing
        users.push(User(msg.sender,0,_name));
        users.push(user2);
        
        // mapping of struct
        
        userList[msg.sender] = User(msg.sender,0,_name); // defining
        userList[msg.sender] = user2; // updating
        
        
    }
}