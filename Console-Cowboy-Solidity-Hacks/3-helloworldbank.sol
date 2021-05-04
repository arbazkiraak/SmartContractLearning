pragma solidity 0.6.6;

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
    
    function withdaw(uint withdrawAmount) public {
        // check for if the caller has enough balance stored in this blockchain to withdraw
        require(withdrawAmount <= balances[msg.sender],"Not enough balance to withdraw");
        // if condition passes then withdraw the amount 
        balances[msg.sender] -= withdrawAmount;
        msg.sender.transfer(withdrawAmount); 
    }
    
    // get function to get uint amount value of msg.sender address.
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
    
    // only owner who deployed the "HelloWorldBank" contract can withdraw all the amount from SC.
    // mostly used by exit scammers when owner can withdraw all the SC amount.
    function withdrawAll() public onlyOwner {   // precheck  with modifier
        msg.sender.transfer(address(this).balance); //  address(this).balance is the total balance on the SC.
    }
    
}