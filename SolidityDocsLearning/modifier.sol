pragma solidity ^0.5.11;

// modifiers are used in  functions to validate the condition first, if modifier pass then only function  gonna execute.
//  a  function could  also have mulitple modifiers check

contract MyContract {
     
    function foo(uint a) external  myModifier(a) { // passing foo function argument "a" to myModifier(a), before executing foo function , our modifier should  pass
        // do  some stuff
    }
    
    modifier myModifier(uint a){
        require(a == 10,'error occured');
        //  
        _; // every modifier should end with _ , when _ hits, foo function gonna execute
    }
    
    
    // access  control checking with modifiers
    
    address admin;
    
    function withdraw(uint amount) external onlyAdmin() {
        
    }
    
    modifier onlyAdmin(){
        require(msg.sender == admin,'only admin can call withdraw function');
        _;
    }
}