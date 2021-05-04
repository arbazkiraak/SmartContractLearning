pragma solidity ^0.7.6;

// A constructor is an optional function that is executed upon contract creation.

contract X {
    string public name;
    
    constructor(string memory _name){
        name = _name;
    }
}

contract Y {
    string public text;
    
    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.
// pass the parameters here in the inheritance list.

contract B is X("input to X"),Y("Input to Y"){ // directly passing argumen _name to X contract and Y
    
}

contract C is X,Y {
    // Pass the parameters here in the constructor,
    // similar to function modifiers.
    constructor(string memory _name,string memory _text) X(_name) Y(_text){
        
    }
}


// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.

// Order of constructors called:
// 1. Y
// 2. X
// 3. E

contract E is X,Y {
    constructor() X("X was called") Y("Y was called"){
        
    }
}

// Order of constructors called:
// 1. Y
// 2. X
// 3. E

contract EE is X, Y {
    constructor() Y("Y was called") X("X was called") {
    }
}