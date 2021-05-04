// fallback is a function that does not take any arguments and does not return anything.
//  it executed when 
// 1. a function that doesnt not exist is called 
// 2. ETH is send directly to a contract but receive() doesnt exist or msg.data is not empty.
// fallback has a 2300 gas limit when called by transfer or send.

pragma solidity ^0.7.6;

contract Fallback {
    event Log(uint  gas);
    
    //fallback function must  be declared as external
    fallback() external payable {
        // send /transfer (forwards a  2300 gas to this fallback function)
        //  call (forwards all of  the gas)
        emit Log(gasleft());
    }
    
    // Helper  function to  check the balance of  this contract
    function getBalance() public view returns (uint){
        return  address(this).balance;
    }
}

// deploy Fallback and copy address

contract SendToFallback {
    
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    
    function callFallback(address payable _to) public  payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent,"Failed to send  Ether");
    }
}

// deploy SendTOFallback, and  paste address and check transactions log for remaining gas emit Log