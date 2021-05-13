pragma solidity ^0.8.0;

contract BlockExploring {
    function get_block() public returns(string memory,uint,address,uint,uint) {
        return ("heres out",block.number,block.coinbase,block.difficulty,block.gaslimit);
    }
    // deploy
    // keep clicking on "get_block" and check  transaction "decoded output"
    
    
    
    // fails don't know why
    function get_block_hash(uint block_number) public returns(bytes32 hash){
        //return block.blockhash(block_number); //  desperated in  newer solidity version
        return blockhash(block_number);
    }
}