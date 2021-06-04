pragma solidity ^0.5.0;

contract Contract {
    function function1() public {}
    function getBalance(address _address) public view returns (uint256){}
    function getValue (uint _value) public pure returns (uint) {
        return _value + 1;
    }
}

contract Other {
    Contract c1 = new Contract();
    
    function get_selector() public view returns(bytes4,bytes4){
        return (c1.function1.selector,c1.getBalance.selector);
    }
    
    function selector_data_usecase(uint _x) public  view returns(uint){
        bytes4 selector = c1.getValue.selector;
        
        bytes memory data = abi.encodeWithSelector(selector,_x); // hashing: selector along with argument
        (bool success, bytes memory returnedData) = address(c1).staticcall(data); //  calling function with `data`
        require(success); // call should  be successfull
        
        return abi.decode(returnedData,(uint256)); // then return  data
    }
}


// deploy `Other` and click `get_selector` , it will  return the selector of that function
// we can use this selector bytes4 value to construct arguments to invoke functions