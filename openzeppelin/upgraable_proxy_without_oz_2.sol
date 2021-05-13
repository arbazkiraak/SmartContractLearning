pragma solidity ^0.4.26;

import './upgradable_proxy_without_oz.sol';

contract Registry is Storage, Ownable {

    address public logic_contract;

    // only owner can  set the address for `logic_contract`
    function setLogicContract(address _c) public onlyOwner returns (bool success){
        logic_contract = _c;
        return true;
    }
    
    
    // raw way to upgrade the SC without using OZ lib
    function () payable public {
        address target = logic_contract;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, target, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            case 1 { return(ptr, size) }
        }
    }
}


// 1. deploy both registry and logic sol.
// 2. We register LogicOne deployed address in Registry.sol, ie
// 3. LogicOne.setVal(2)
// 4. When we are ready to upgrade LogicOne to LogicTwo ex: deploy logicTwo contract and update the registry contract to point to it.
// Registry.at(Registry.address).setLogicContract(LogicTwo.address)
// 5. LogicTwo.at(Registry.address).setVal(2) ### We can now control Registry’s storage with LogicTwo.