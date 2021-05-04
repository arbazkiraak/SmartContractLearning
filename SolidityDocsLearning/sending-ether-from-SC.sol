pragma solidity ^0.5.11;

contract MyContract {
    
    // address payable : means smart contract can send ether to the argument address
    function sendEther(address payable recipient) external {
        recipient.transfer(1 ether); //  transfer 1 ether from this smart contract to recipient, address.transfer(amount)
    }
    
    // define array of address payables 
    address payable[] recipients;
    
    // define a  single address payable
    address payable public owner;
    
    // msg.sender
    //msg.sender.transfer(100);
    
    // transfer vs send
    // transfer function would return error if transfer fails.
    // send function would return boolean value if transfer fails i.e false, true if success.
    address a;
    a = arbazaddr;
    arbazaddr.send(1 ether);
    
}