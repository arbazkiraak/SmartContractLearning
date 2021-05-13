pragma solidity ^0.8.0;

/*

ERC20 tokens provides functionalities to:
1. transfer tokens.
2. allow others  to transfer tokens on behalf on the token  holder

*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


/*

interface IERC20 {
    function totalSupply() external view returns(uint256); // total supply of tokens
    function balanceOf(address account) external view returns(uint256); // balance of address
    function transfer(address recipient,uint256 amount) external returns (bool); // transfer from  to amount
    
    
    // this below 3 functions allow to transfer the tokens behalf of the token holder: 
    
    
    // address can allow other address to spent amount/tokens behalf of him by using allowance method.
    
    function allowance(address owner,address spender) external view returns (uint256); // amount of tokens an  holder can spent on an address.
    function approve(address sender,uint256 amount) external returns (bool); // to  approve the allowance an holder can spent
    function transferFrom(address sender,address recipient,uint256 amount) external returns (bool); // allow to spend token behalf of the token holder to any adress recipient with the amount approved in allowance
    
    event Transfer(address indexed from,address indexed to,uint256 value);
    event Approval(address indexed owner,address indexed spender,uint256 value);
}

*/

contract MyToken is ERC20 {
    
    // building a token
    constructor(string memory name,string memory symbol) ERC20(name,symbol) public {
        
        // 1.00 USD = 100 cens (2 decimals)
        // 1 ETHER = 10 ** 18 wei (18 decimals)
        
        // _mint is the function responsible for sending an token amount to address 
        // so we are sending "100" tokens to the user who deployed this contract.
        _mint(msg.sender,100 * 10 ** uint(decimals()));    
    }
}

// DEPLOY  the contract with `ArbazCoin,AC` as arguments
// play iwth different functions we have with 2 address , by transfering approving etc.