pragma solidity ^0.8.0;
  
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";  

/*

Swapping is the method to swap X token from A user for y token from B user. which depends on how  many takes users have approved for allowance an contract can spent.

1. This contract will swap tokens by calling

transferFrom(address sender, address recipient, uint256 amount)

which will transfer amount of token from sender to recipient.

2. For transferFrom to succeed, sender must

* have more than amount tokens in their balance.
* allowed tokenswap contract to withdraw amount tokens by calling approve method.

*/

/*
How to swap tokens

1. Alice has 100 tokens from AliceCoin, which is a ERC20 token.
2. Bob has 100 tokens from BobCoin, which is also a ERC20 token.
3. Alice and Bob wants to trade 10 AliceCoin for 20 BobCoin.
4. Alice or Bob deploys TokenSwap
5. Alice appproves TokenSwap to withdraw 10 tokens from AliceCoin
6. Bob appproves TokenSwap to withdraw 20 tokens from BobCoin
7. Alice or Bob calls TokenSwap.swap()
8. Alice and Bob traded tokens successfully.
*/

contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    uint public amount1;
    
    IERC20 public token2;
    address public owner2;
    uint public amount2;
    
    constructor(address _token1,address _owner1,uint _amount1,address _token2,address _owner2,uint _amount2){
        token1 = IERC20(_token1); // takes address in arg
        owner1 = _owner1;
        amount1 = _amount1;
        
        token2 = IERC20(_token2);
        owner2 = _owner2;
        amount2 = _amount2;
    }
    
    function swap() public {
        
        // ehither owner1 or owner2 could run this function for swap
        require(msg.sender == owner1 || msg.sender == owner2,"Not authorized");
        
        // checking the amount if  owner1 has greather amount or enough amount in this SC to transfer the amount and did they approve to spend that amount.
        require(token1.allowance(owner1,address(this)) >= amount1,"TOken 1 allowance too low"); 
        require(token2.allowance(owner2,address(this)) >= amount2,"Token 2 allowance too low");
        
        // transfer funds
        
        _safeTransferFrom(token1,owner1,owner2,amount1);
        _safeTransferFrom(token2,owner2,owner1,amount2);
        
    }
    
    
    // token1,owner1,owner2,amount1 -> sending token amount from owner1 to owner2
    // token2,owner2,owner1,amount2
    function _safeTransferFrom(IERC20 token,address sender,address recipient,uint amount) private {
        bool sent = token.transferFrom(sender,recipient,amount);
        require(sent,"Token transfer failed");
    }
    
}