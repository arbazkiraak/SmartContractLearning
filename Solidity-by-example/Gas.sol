pragma solidity ^0.7.6;

/*

Q) How much ether do  you need to pay for a transaction?

its : gas spent * gas price amount of ether

gas -> unit of computation
gas spent -> total amount of gas used in a transaction
gas price -> how much ether you  are willing to pay per gas

Note1: Transactions with higher gas price have higher priority to be included in a block.
Note2: Unspent gas will be refunded.


gas limit ->  max amount of gas you are willing to use for the transaction, set by us.
block gas limit -> max amount of gas allowed in a block,set by the network.

*/

contract GAS {
    uint public i = 0;
    
    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    
    function forever() public {
        while(true){
            i +=  1;
        }
    }
    
}