 pragma solidity ^0.7.6;
 
 // Functions and addresses declared payable can recieve ether into the contract.
 
 contract Payable {
     
     // payable address can reciveve ether
     address payable public owner;
     
     // payable constructor can reciveve ether
     constructor() payable {
         owner = payable(msg.sender);
     }
     
    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    
    function deposit() payable public {
        
    }
    
    // call this  function  along with some ether,  functionwill throw error  since it's not payable 
    function notPayable() public {
        
    }
    
    
    // function to withdrawl all ether from this contract
    function withdraw() public {
        // get amount of ether sstored in this contract
        uint amount = address(this).balance;
        
        // send all ether to owner
        // Owner can receive Ether since the address of owner is payable
        (bool success,) = owner.call{value: amount}(""); // using "call" to send ether
        require(success,"Failed to send ether to owner"); // true, if false then  revert
    }
    
    // function to  transfer ether from this contract to address  from  input
    function transfer(address payable _to,uint _amount) public {
        (bool success,) = _to.call{value:_amount}("");
        require(success,"Failed to  send ether");
    }
    
     
 }