pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";


contract ExampleToken is  StandardToken, DetailedERC20, BurnableToken{

    // initliazing the token
  constructor(string _name, string _symbol, uint8 _decimals) DetailedERC20(_name, _symbol, _decimals) public {
  	totalSupply_ = 10000;
  	balances[msg.sender] = 10000;
  }

}


contract BurnableToken is ExampleToken {
  event Burn(address indexed burner, uint256 value);
    
  
  function burn(uint256 _value) public {
    _burn(msg.sender, _value);
  }
  
  // 1. it will reduce the token balance of the account who is executing the transaction.
  function _burn(address _who, uint256 _value) internal {
        require(_value <= balances[_who]);
        balances[_who] = balances[_who].sub(_value);
        totalSupply_ = totalSupply_.sub(_value); //  Then the method is reducing the total supply of our token
        emit Burn(_who, _value);
        emit Transfer(_who, address(0), _value); // This point is noteworthy, as you can see there is no actual transfer to address(0). It’s just emitting an event which shows token is transferred to address(0). This achieves the same results as we are reducing the total supply. 
      }
}