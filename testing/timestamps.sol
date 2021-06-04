pragma solidity >=0.8.4;

import "@openzeppelin/contracts/utils/math/SafeCast.sol";

contract TS {
    uint64 public timestamp = block.timestamp.toUint64();
}