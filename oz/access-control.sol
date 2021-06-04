/*
-> Ownable.sol

1. there's an account this is `owner` of a contract and can do administrative tasks  on it.
2. OpenZeppelin provides `Ownable` for implementing ownership in your contracts.

*/

pragma solidity ^0.8.0;

// https://docs.openzeppelin.com/contracts/4.x/api/access#Ownable

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// using Ownable in `MyContract`
contract OwnableFunctionTest is Ownable {
	function normalThing() public {
		// anyone can call normalThing()
	}

	function specialThing() public onlyOwner {
		// only the owner call call specialThing()
	}
}

// deploy and play with different accounts.


/*
-> AccessControl.sol

Provies general role  based access control mechanism. Multiple hierarchical roles can becreated and assigned each to multiple accounts.
* Role based access controls (RBAC)
* ex: 'moderator','minter' or 'admin' roles, Separately, you will be able to define rules for how accounts can be granted a role, have it revoked, and more.
*/

import "@openzeppelin/contracts/access/AccessControl.sol";

contract AccessControlTest is AccessControl {
    
    bytes32 public constant MY_ROLE = keccak256("HACKER");
    
    function hasRoleCheck() public {
        require(hasRole(MY_ROLE,msg.sender),"Caller is not an Hacker role"); // checking if caller has role of "Hacker";
    }
}


contract MyRolesBasedToken is ERC20, AccessControl {
    
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    
    constructor(address minter,address burner) ERC20("MyToken","TKN"){
        _setupRole(MINTER_ROLE,minter); // setting minter_role
        _setupRole(BURNER_ROLE,burner); //  setting burner_role
    }
    
    // ONLY MINTER_ROLE can mint
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount); // to addres to mint tokens
    }

    // ONLY BURNER ROLES ADDRESS can burn
    function burn(address from, uint256 amount) public onlyRole(BURNER_ROLE) {
        _burn(from, amount); // from  address to burn tokens
    }
}

// deploy with "x" address by setting "y" minter address, "z" burner address.
// now you can see all API to call.
/*
hasRole api check:

1. call MINTER_ROLE, copy keccak256 hash of "MINTER_ROLE" 
2. hasRole(MINTER_ROLE,address) , it would return true if address has MINTER_ROLE
*/

/*
calling mint function:

1. change address from dropdown list to mint addresss which was set in the constructor.
2. now using this address, add to address and amount to mint to that addresss.

after done, use balanceOf function  to check balance of tokens minted.
*/

