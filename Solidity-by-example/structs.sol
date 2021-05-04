pragma solidity ^0.7.6;

// useful for grouping together related data.

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos; // struct arrays to store mulitple 
    
    function  create(string memory _text) public {
        // 3  ways to intialize a struct
        todos.push(Todo(_text,false));
        todos.push(Todo({completed: false,text:_text}));
        //  last way is
        Todo memory todo; //intialize empty struct and then update it.
        todo.text = _text;
        // todo.completed is false by default
        todos.push(todo); // above above created struct to  array
    }
    
    
    function get(uint _index) public view returns (string memory text,bool completed){
        Todo storage todo = todos[_index]; // u  need to define like this  to get index from array
        return (todo.text,todo.completed);
    }
    
    function update(uint _index,string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    } 
    
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = true;
    }
    
}