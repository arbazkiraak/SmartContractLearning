pragma solidity ^0.5.11;

//  using solidity "EVENTS", we can push data from smart contract to outside like web frontend, mobile example using web3.js
// we use events to upadate the data at frontend. ex: whenever someone swap or trade, emit can show trade activitiy at frontend in  realtime.

contract MyContract {
    
    //  define a event
    event NewTrade ( // events are structured data
        uint date,
        address from,
        address to,
        uint amount
    );
    
    function onTrade(address to,uint amount) external {
        emit NewTrade(now,msg.sender,to,amount); // we use emit to transfer data from here to frontend who is lisiting for event 
    }
    
    // events also use indexes to  filter data from multiple events, maximum events it can record is 3 by default.
    
    event NewTrades ( 
        uint indexed date,
        address indexed from,
        address indexed to,
        uint amount
    );
 
    
}