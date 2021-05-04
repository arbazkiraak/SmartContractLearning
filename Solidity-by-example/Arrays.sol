pragma solidity ^0.7.6;

contract Array {
    // several ways to initalize
    uint[] public arr;
    uint[] public arr2 = [1,2,3];
    uint[10] public myFixedSizeArr; // length of 10
    
    function get(uint i) public view returns (uint){
        return arr[i];
    }
    
    // solidity can also return array, but we should avoid returing  arrays because
    // arrays can grow indefintely in legnth, until and unless fixed length is used.
    
    function getArr() public view returns (uint[] memory){
        return arr;
    }
    
    function push(uint i) public {
        arr.push(i); // append to array, increase the array length by 1.
    }
    
    function pop() public {
        arr.pop(); //  remove last element 
    }
    
    function getLength() public view returns (uint){
        return arr.length;
    }
    
    function remove(uint index) public {
        delete arr[index];
        // note: delete doesn't change array length
        // it reset the value of  that index to default value i.e "0" for uint
    }
    
    
}


contract CompactArray {
    uint[] public arr;
    
    // deleting an element creates a gap in the array.
    // one trick to keep the array compact is  to move the last element into the place to delete.
    
    function remove(uint index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // remove the last element.
        arr.pop();
    }
    
    
    function test() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        arr.push(4);
        // [1, 2, 3, 4]

        remove(1); // by index location
        // [1, 4, 3]

        remove(2);
        // [1, 4]
    }
}