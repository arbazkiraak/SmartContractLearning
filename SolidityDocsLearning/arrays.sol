pragma solidity ^0.5.11;

contract MyContract {
    // 1. storage arrays ### Stores permannently in blockchains
    // 2. memory arrays  ### stays temp when we exec functions
    
    // 1. storage arrays
    uint[] myArray;
    bool[] myTruthArray;
    
    /*
    Array Operations:
    1. crud
    2. create
    3. read
    4. update.
    5. delete
    */
    
    function foo() external {
        myArray.push(2); // [2]
        myArray.push(3); // [2,3]
        
        myArray[0]; // 2
        
        myArray[0] = 4; // [4,3]
        myArray[0]; //4
        
        delete myArray[1]; //  deletes 3 , it removes the index[1] and replace it with value "0" , if array is of  boolean then default value would be false.
        
        
        for(unit i=0; i < myArray.length; i++){
            myArray[i]; looping array indexes
        }
    }
    
    
    // MEMORY ARRAYS :  they are  not stored inside of blockchain, they are stored temp until we  perform functions on blockchain
    
    function bar() external {
        uint[] memory newArray = new uint[](10); // we are defining an  array inside of  function unlike outside in above, we defined array of ints of length 10;
        
        // memory  arrays doesn't use .push method to  add elements to array. they used indexing to  add.
        newArray[0] = 10;
        newArray[1] = 20;
        
        newArray[0]; // reading, 10
        
        newArray[0] = 30; //updating.
        
        delete newArray[5]; // deleting element
    }
    
    
    // Arrays in functions args, you need to define extra keywords based on function external,internal,public visibility.
    //  external = calldata ; this keywords are actually memory locations
    // public = memory;
    // internal  = memory;
    
    
    // function takes array as argument and return a function.
    function fooBar(uint[] calldata myFooAraay) external returns(unit[] calldata) { 
        
    }
    
}