pragma solidity ^0.7.6;

/*
We can send ether to other contracts by 

1. transfer -  (2300 gas,throws error)
2. send - (23300  gas,returns bool)
3. call - (forward all gas or set gas, returns bool)

A contract receiving Ether must have at least one of the functions below

1. receive() external payable -> is  called if msg.data is  empty. otherwise fallback() is called.
2. fallback() external payable


Best method  to  send is "call", call in combination with re-entrancy guard is the recommended method to use after December 2019.
*/

contract ReceiveEther {
        /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */
    
    // function  to recieve ether. msg.data must be empty
    receive() external payable {}
    
    // fallback function  is called when msg.data is not  empty.
    fallback() external payable {}
    
    
    // function to  get  total balance of the current smart contract
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}

contract SendEther{
    function  sendViaTransfer(address payable  _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value); // msg.value is automatically set to the amount of ether sent with that payable function.
    }
    
    function sendViaSend(address payable _to) public payable {
        // send - returns a boolean value indicating success or failure.
        //This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent,"Failed to  send ether.");
    }
    
    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is current recommened method to use, as  it comes with  some extra guard protection.
        (bool sent,bytes memory data) = _to.call{value:msg.value}("");
        require(sent,"Failed to send ether");
    }
}