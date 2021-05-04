pragma solidity ^0.7.6;


// don't use much loops in smart contracts, it gonna hit gas limit, causing tranaction to fail. for that reasons while and do while loops are rarely used.

contract Loop  {
    function  loop()  public{
        for (uint i=0; i < 10; i++){
            if (i ==  3){
                continue;
            }
        }
        
        uint j;
        while (j < 10){
            j++;
        }
    }
}