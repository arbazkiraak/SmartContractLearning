pragma solidity ^0.5.11;

contract MyContract {
    // 1. fixed-size types
    
    bool isReady;
    uint a;
    address recipient; // etherc20 address
    bytes32 data;  // limited to 32 byte limit
    
    // 2. variable-size types
    
    string name;
    bytes _data; // no limit
    
    uint[] amounts; // array of integers
    
    mapping(uint => string) users;  // dictionary, where {"int":"string"} of users

    
    //3. user-defined data
    
    struct User {
        uint id;
        string name;
        uint[] refferalIDS;
    }
    
    // enum just used for labling to access the list of it.
    enum Color { 
        RED,
        GREEN,
        BLUE
    }
    
    // ex: Color.RED,Color.GREEN


    
}