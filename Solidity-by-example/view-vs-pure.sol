pragma solidity ^0.7.6;

/*

VIEW - that no state will be changed.
PURE - that no state variable will be changed or read.

*/

contract ViewAndPure {
    uint  public x = 1; //state variable, stored on bloickchain
    
    // promise to not to modify the state;
    function addToX(uint y) public view returns (uint){
        return  x + y;
    }
    
    // promise to not to modify or  read  from the state, we didn't use any state or anything which  is stored on blockchain
    function  add(uint i,uint j) public pure returns (uint) {
        return i + j;
    }
}