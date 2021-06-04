pragma solidity ^0.5.11;

/*

1. uint8 = 0 to 255 , 1 byte per element.
2. uint16 = 0 to 65,535 , 2 bytes per element .      (255 * 255) = 65k
3. uint32 = 0 to 4,294,967,295 , 4 bytes per element  (65k * 65k)


*/


contract MyContract {
    uint8 public a;
    uint8 public b;
    
    constructor() public{
        a = 255;
        //b = 300; // you can't assign value greather than 255 because max value of uint8 is 255.
    }
    
}