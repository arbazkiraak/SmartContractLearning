pragma solidity ^0.7.6;

// Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.

contract A {
    string public name = "Contract A";
    
    function getName() public view returns (string memory){
        return name;
    }
}

contract B is A {
    string public name = "Contract B"; // solidty complains here, because you   can't override A.name variable in inheritance
}

contract C is A {
    // This is the correct way to override inherited state variables. i.e A.name , using  constructor
    constructor() {
        name = "Contract C";
    }
}

 // C.getName returns "Contract C"