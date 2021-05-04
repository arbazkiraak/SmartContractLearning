pragma solidity ^0.7.6;

/*

1. call is low  leven function  to  interact with other contracts.
2. is it recommeneded way to use whensending ether via calling fallback function.
3. However it is not the recommend way to call existing functions.

*/


/*
How to receive Ether?
A contract receiving Ether must have at least one of the functions below

receive() external payable
fallback() external payable
receive() is called if msg.data is empty, otherwise fallback() is called.
*/

contract Receiver {
    event Received(address caller,uint amount,string message);
    
    receive() external payable {
        emit Received(msg.sender,msg.value,"Fallback  was called");
    }
    
    function foo(string memory _message,uint _x) public payable returns (uint){
        emit Received(msg.sender,msg.value,_message);
        
        return _x + 1;
    }
}


// deploy reciever first and copy address, then deploy below caller and play around.

contract Caller {
    event Response(bool success,bytes data);
    
    // Let's imagine that contract B does not have the source code for
    // contract A, but we do know the address of A and the function to call.
    
    function testCallFoo(address payable _addr) public payable {
        //  you cam semd ether and specify a custom gas amount
        (bool success,bytes memory data) = _addr.call{value: msg.value,gas: 5000}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123) //  running Receiever.foo("call foo",123); function 
        );
        
    emit Response(success,data);
    }
    
    
    // calling a  function that doesn not  exist triggers the fallback functions.
    function testCallDoesNotExist(address _addr) public {
        (bool success,bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesntNotExists()")
        );
        
        emit Response(success,data);
    }
}