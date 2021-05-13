pragma solidity ^0.7.6;

contract HelloWorld {
    uint age = 10; //  default solidity consider variable as "private/internal", which is not possible to interact. 
    string public greet = "Hello World"; // public to interact by deploying.
    
}