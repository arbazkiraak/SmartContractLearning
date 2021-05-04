pragma solidity ^0.7.6;

// https://www.youtube.com/watch?v=Yh8UL7FZwAI

/*
delegatecall is a low level function similar to call.

1. When contract A executes delegatecall to contract B, B's code is excuted 
with contract A's storage, msg.sender and msg.value.
*/


// deploy this contract "B" first
contract B {
    uint public num;
    address public sender;
    uint public value;
    
    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// then deploy this "A" ,and copy B address and play around.
contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}