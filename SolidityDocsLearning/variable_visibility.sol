pragma solidity ^0.5.11;

contract MyContract {
    uint private a; // can't be access by external
    uint b; // bydefault solidity consider it as private.
    uint internal c; // similar to private with some extra features
    uint public d; // can be access inside and outside of smartcontract
    
    function foo() external {
        uint b = a + 1;
    }
}