pragma solidity ^0.5.11;

import './Token.sol';

contract TransferToken {
    function transfer() external {
        Token token = Token(0xdD870fA1b7C4700F2BD7f44238821C26f7392148); // accessing the ERC20 smartcontract 
        token.transfer(msg.sender,100); //calling its function from https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/eeeb3a5be112c18696ea032b006151d3ff5e1dcc/contracts/token/ERC20/ERC20.sol
        
    }
    
    function transferFrom(address recipient,uint amount) external {
        Token token = Token(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
        token.transferFrom(msg.sender,recipient,amount); // from  openzeppeline function
    }
}

contract Owner {
    function transfer(address recipient,uint amount) external {
        Token token = Token(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
        token.approve(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,amount); // before transfer ,  we need to approve the sender.
        // in future  if  you  need to revoke an approval, all  you need to  do is  add amount as "0"
        
        TransferToken transfertoken = TransferToken(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        transfertoken.transferFrom(recipient,amount);
        
        
    }
}