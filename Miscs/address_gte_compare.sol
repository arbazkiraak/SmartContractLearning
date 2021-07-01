pragma solidity >=0.7.0 <0.9.0;

// test() would return true because `addr1` is > `addr2`

contract MyTest {
    address public addr1 = 0x000000000000000000636F6e736F6c652e6c6f67;
    address public addr2 = 0x0000000000000000000000000000000000000000;
    
    function test() public returns(bool){
        return addr1 > addr2;
    }
}         
