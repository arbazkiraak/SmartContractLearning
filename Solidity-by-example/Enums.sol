pragma solidity ^0.7.6;

contract Enum {
    
    // enum represents shipping status, anything which have different status,properties, like colors: red,blue,grey
    enum STATUS { // best practice to use define enum CAPS
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancelled
    }
    
    
    // default value of the enum is the  first value listed. i.e Pending
    STATUS public status; // it's "Pending", enums are reffered as uint
    
    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    
    function get() public view returns(STATUS){
        return status; // 0 because "Pending"
    }
    
    // Update status by passing uint into input
    function set(STATUS _status) public {
        status = _status;
    }
    
    // updating status using enum type
    function cancel() public {
        status = STATUS.Cancelled;
    }
    
    // reset enum to it's first value, that is , 0, Pending
    function reset() public {
        delete status;
    }
}