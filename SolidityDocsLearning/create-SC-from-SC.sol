pragma solidity ^0.5.11;

contract LoanFactory {
    Loan[] loans; //  creating a array of contract "Loan"
    
    function createLoan() external {
        Loan loan = new Loan(100); // 100 = _amount to constructor of Loan
        loans.push(loan);
        address(loan); // address of created loan 
        
        loan.reimburse(); // calling function 
    }
}

contract Loan {
    uint public amount;
    address admin;
    
    constructor(uint _amount) public {
        amount = _amount;
        admin = msg.sender; // setting  the address of the smart contract who creates it , in our case it's `createLoan()` function at line 6 who gonna create 
    }
    
    function withdraw() external {
        
    }
    
    
    function reimburse() external {
        
    }
}