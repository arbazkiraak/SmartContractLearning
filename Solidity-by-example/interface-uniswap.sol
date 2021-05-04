pragma solidity ^0.7.6;

// https://www.youtube.com/watch?v=YWtT0MNHYhQ

interface UniswapV2Factory {
    function getPair(address tokenA,address tokenB) external view returns (address pair);
}

interface UniSwapV2Pair {
    function getReserves() external view returns (uint112 reserved,uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f; // address of factory
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
 
    function getTokenReserves() external view returns (uint,uint){
        address pair = UniswapV2Factory(factory).getPair(dai,weth); // to get the pair address of "dai" and "weth" from uniswap factory address.
        (uint reseved0,uint reseve1,uint32 blocktimestamp) = UniSwapV2Pair(pair).getReserves(); // we gonna get the reseved amount from  the pair address.
    
        return (reseved0,reseve1); // returing both amounts from pair address
        
    }
    
}