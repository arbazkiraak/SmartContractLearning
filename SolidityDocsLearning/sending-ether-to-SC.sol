pragma solidity ^0.5.11;

contract MyContract {
    // in order to send/add ether to smart contract, we need to  add "payable" keyword to function
    function invest() external payable {
        if(msg.value < 1000){ //  if the amount value is less than 1000 wei, we gonna just cancel the trasnaction. else  payable keyword automically adds  the gwei ether to smart contract
            revert();
        }
    }
    
    
    function balanceOf() external view returns(uint){
        return address(this).balance; //  this refereces to "this" smart contract, .address  access the smart contract address.
    }
    
}