pragma solidity ^0.4.26;

//https://medium.com/@blockchain101/the-basics-of-upgradable-proxy-contracts-in-ethereum-479b5d3363d6

/*
The idea is to have
1 storage contract, 
1 registry Contract and 
1 logic Contract. 
Whenever there is a need to add a new or upgrade an existing function in the logic contract,
just create a new logic contract, inheriting from the current one.
*/


// contract1 : which we  gonna modify using upgradeable proxy
contract Storage {
    uint public val;
}


// contract2 : Just to check only owner can run the proxy to upgrade the contract
contract Ownable {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

}

// contract3: updating the value of `Storage` contract variable `val` using `LogicOne`
contract LogicOne is Storage {
    function setVal(uint _val) public returns (bool success) {
        val = 2 * _val;
        return true;
    }
}

// next in `upgraable_proxy_without_oz_2.sol`