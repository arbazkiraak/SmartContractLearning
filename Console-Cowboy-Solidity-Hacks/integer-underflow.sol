// DONT USE , NEED SOME FIXING

pragma solidity 0.6.6;

contract UnderFlow {
    mapping(address => uint) private balances;
    
    // try with 6-5
    // then try with 5-6, this gonna return large value of ether in wei
    function behaviour_check(uint a,uint b) public pure returns(uint){
        return a - b;
    }
}

// deploy
// 1. deposit -  1000 wei
// 2. getBalance
// 3. withdraw - 1100 wei
// condition = CONSUSING   HERE, TODOS NEED FIXING

contract HelloWorldBank {
    address public owner;
    mapping(address => uint) private balances;
    
    // setting caller address to  owner
    // making constructor payable so that we can deploy with some ether balance for SC.
    constructor() public payable {
        owner = msg.sender;    
    }
    
    //  checking if caller is the actual owner
    function isOwner() public view returns(bool){
        return msg.sender == owner;
    }
    
    // modifier to check if isOwner() to add a check on the functions for authentication  check
    modifier onlyOwner(){
        require(isOwner(),"Is not an owner");
        _;
    }
    
    function deposit() public payable {
        // check for balance of user calling this function + value he is depositing in this contract is >= actual balance of that user.
        // to prevent overflow condition
        require((balances[msg.sender] + msg.value) >= balances[msg.sender],"Not enough balance");
        // if condition passes then depositing/adding the amount he sent to his existing balance.
        balances[msg.sender] += msg.value;
    }
    
    //  VULNERABLE FUNCTION
    function withdaw(uint withdrawAmount) public {
        // check for if the caller has balanace greathan than 0 after removing withdrawlamount
        require(balances[msg.sender] - withdrawAmount >  0,"Not enough balance to withdraw");
        // if condition passes then withdraw the amount 
        balances[msg.sender] -= withdrawAmount;
        msg.sender.transfer(withdrawAmount); 
    }
    
    // get function to get uint amount value of msg.sender address.
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
    
    
}