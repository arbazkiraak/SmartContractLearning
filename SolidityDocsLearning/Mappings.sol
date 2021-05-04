pragma solidity ^0.5.11;

contract MyContract {
    // declare mappings
    
    
    // {"0x325235235235325":100}
    mapping(address => uint) balances;
    
    mapping(address => mapping(address => bool)) approved_check; /// nested mapping
    
    mapping(address => unit[]) scores; // array mapping
    
    function foo(address sender) external { //  taking input as address
        // adding
        balances[msg.sender] =  100;
        
        //  reading
        
        balances[msg.sender];
        
        // update
        
        balances[msg.sender] =  200;
        
        // delete
        
        delete balances[msg.sender];
        
        
        // It is possible  to access the indexes in  the mappings which doesn't  exist,  and the default values for non-existing indexes return "0"
        // default uint value is 0, default bool  value is false
        balances[someAddressWhichDoesntExist]; // will return  0
        
        /////////////////////////////
        
        // nested mapping
        
        approved_check[msg.sender][spender] = true; // adding reference address "spender" to "msg.sender" address. // this  is how to add 
        approved_check[msg.sender][spender]; // read
        approved_check[msg.sender][spender] = false; // update
        delete approved_check[msg.sender][spender] // delete
        
        ///////////////////////////
        
        //  array mapping
        
        scores[msg.sender].push(1);
        scores[msg.sender].push(2);
        scores[msg.sender][0]; // reading
        scores[msg.sender][0] = 10; //update
        delete scores[msg.sender][0]; //  delete
        
        
    
        
    }
}