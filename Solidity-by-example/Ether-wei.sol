pragma solidity ^0.7.6;

contract EtherUnits {
    uint public oneWei = 1 wei;
    
    bool public isOneWei = 1 wei == 1; // 1 wei is equals to 1 , Note: 1 represents 1 wei in solidity
    
    uint public  oneEther = 1 ether;
    // 1 ether is equal to 10^18 
    
    bool public isoneEther = 1 ether == 1e18;
}