pragma solidity ^0.7.6;

// Contracts can be created by other contracts using the new keyword.

contract Car {
    address public owner;
    string public model;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
    }
}

// deploy Car

contract CarFactory {
    Car[] public cars; // creating arrays of SC
    
    // can create mulitiple cars and add to array
    function create(address _owner,string memory _model) public {
        Car car = new Car(_owner,_model); // passing arguments directly to Constructor
        cars.push(car);
    }
    
    function createAndSendEther(address _owner,string memory _model) public payable {
        Car car = (new Car){value: msg.value}(_owner,_model);  // storing the balance aswell to car, passing arguments to constructor
        cars.push(car);
    }
    
    function getCar(uint _index) public view returns (address owner,string memory model,uint balance){
        Car car = cars[_index];
        return (car.owner(),car.model(),address(car).balance);
    }
}