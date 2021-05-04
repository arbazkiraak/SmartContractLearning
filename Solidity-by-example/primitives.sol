pragma solidity ^0.7.6;

contract Primitives {
    // data types are  
    // 1. bool
    // 2. uint - unsigned integer,meaning non negative integers , 0 to 65535
    // 3. int - signed integer, can store both +, - values.  -32768 to +32767
    // 4. address
    
    bool boo = true;
    
    //  store positive integers only, can  store large values than signed integers can
    uint8 u8 = 1;
    uint256 u256 = 456;
    uint u = 123;
    
    
    // negative numbers allowed for signed integers
    int8 i8 = -1;
    int256 i256 = 456;
    int i = -123;
    
    address addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    
    // default values of datatypes
    
    bool defaultBoo; //false
    uint defaultUint; // 0
    int defaultInt; // 0 
    address defaultAddr; // 0x0000000000000000000000000000000000000000
    
}