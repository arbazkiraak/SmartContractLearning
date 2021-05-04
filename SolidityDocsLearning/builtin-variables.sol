pragma solidity ^0.5.11;

contract MyContract {
    
    // txs
    tx.origin // eth address of sender address
    
    // msg
    msg.value // amount of ether send in wei
    msg.sender // eth address of sender address, same as tx.origin , but when multiple smart contract changes it stores the last smart contract address, address of caller who is calling a function or smart contract.
    
    
    // block
    block.timestamp // time when block was mined. in seconds
    now // current timestamp
}