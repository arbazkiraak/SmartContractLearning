pragma solidity ^0.5.11;

contract MyContract {
  // enums represents different options  ex: color have different options like red,blue,yellow etc 
  
  enum STATE {INACTIVE,ACTIVE} // keep naming for ENUM uppercase, best practice tip
  STATE state_status;
  
  
  // using struct with enums 
  
  struct User {
      string name;
      STATE state_status;
  }
  
  
  // setting
  function  setToActive() external {
      state_status = STATE.ACTIVE;
      
      
  }
  
  // reading
  function readEnum() external {
      if (state_status == STATE.ACTIVE){
          // do somethingg here
      }
  }
  
  // taking enum as input to  function arg
  
  function foo(STATE _somename){
      // do sometyhing
  }
  
}