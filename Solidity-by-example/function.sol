pragma solidity ^0.7.6;

contract Function {
    
    // return multiple values
    function returnMany() public returns (uint,bool,uint){
        return (10,true,10);
    }
    
    // return values can be named. useful when we call: x,b,y = named()
    function named() public pure returns (uint x,bool b,uint y){
        return  (1,true,2);
    }
    
    // return values can be assigned to  their  names, so that our return statement automatically returnbs them
    function assigned() public pure returns (uint x,bool b,uint y){
        x = 1;
        b = true;
        y = 2;
    }
    
    function destructingAssignments() public returns (uint,bool,uint,uint,uint){
        
        (uint i, bool b, uint j) =  returnMany();
        
        // values can be left  out.
        (uint x,,uint y) = (4,5,6);
        
        return (i,b,j,x,y);
    }
    
    // we  cannot use maps for input or output onfunctions.
    // we can use arrays for input
    
    // Can use array for input
    function arrayInput(uint[] memory _arr) public {
    }
    
    // can  use array for output
    uint[] public arr;
    
    function arrayOutput() public view returns (uint[] memory){
        return arr;
    }
}