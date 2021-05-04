pragma solidity ^0.7.6;

/*
Variables  are decalared either storage,memory or calldata to specify location of data.

1. storage: variable is a state variable (stored on blockchain)
2. memory: variable is in memory and it exists while a function is being called.
3. calldata: special data location in function arguments, only available for external functions.

*/

contract DataLocations {
    // state variables/ stored on blockchain
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;
    
    
    function f() public {
        // calling _f function with state variables
        _f(arr,map,myStructs[1]);
        
        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a  struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }
    
    function _f(uint[] storage _arr,mapping(uint => address) storage _map,MyStruct storage _myStruct) internal {
        // do something with storage variables
    }
    
    // you can return memory variables
    function  g(uint[] memory _arr) public returns (uint[] memory){
        return _arr;
    }
    
    function  h(uint[] calldata _arr) external {
        // do  something
    }
    
}