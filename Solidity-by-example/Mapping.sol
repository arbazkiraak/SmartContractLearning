pragma solidity ^0.7.6;

/*
Maps are created with key,value ex: mapping(keyType => valueType)

keyType -> can be uint,address,string,bytes
valueType -> can be array,nested mapping or datatype.

*/

contract Mapping {
    
    // {0xxxxxx:100}
    mapping(address => uint) public myMap;
    
    function get(address _addr) public view returns (uint){
        // get value of the address
        // even if the address doesn't exist, it always gonna return 0 for non existing keyttpes
        return myMap[_addr];
    }
    
    function set(address _addr,uint _i) public {
        // updating value of the address
        myMap[_addr] = _i;
    }
    
    function remove(address _addr) public {
        delete myMap[_addr]; // reset the value to  the default value i.e 0
    }
    
}