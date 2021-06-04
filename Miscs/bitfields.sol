pragma solidity ^0.5.11;

// https://medium.com/@imolfar/bitwise-operations-and-bit-manipulation-in-solidity-ethereum-1751f3d2e216
// https://ethereum.stackexchange.com/questions/77099/efficient-bit-packing

contract Bit {
    
    function getBoolean(uint256 _packedBools,uint256 _boolNumber) public view returns (bool)
    {
        uint256 flag = (_packedBools >> _boolNumber) & uint256(1);
        return (flag == 1 ? true : false);
    }

}