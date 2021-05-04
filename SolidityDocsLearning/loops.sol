pragma solidity ^0.5.11;

contract MyContract {
    function foo() external {
        //if(msg.sender == 100 && block.timestamp > 32523523) ## conditional  operators
        
        for(uint i = 0;i < 10; i++){ // for loops
            // i
        }
        
        bool isOk = true;
        while(isOk){ // while loop
            // run something
            if(somecondition_met){
                isOk = false;
                break // break the loop if condition met.
            }
            
        }
        
    }
}