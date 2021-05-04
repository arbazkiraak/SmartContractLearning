pragma solidity ^0.7.6;

// Parent contracts can be called directly, or by using the keyword super.
// By using the keyword super, all of the immediate parent contracts will be called.

contract A {
    event Log(string message);
    
    // whenever you see virtual , it means functions gonna get modified by other contracts
    function foo() public virtual {
        emit Log("A.foo called!");
    }
    
    function bar() public virtual {
        emit Log("A.bar called!");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
    }
    
    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar(); // executes parent contract , "A.bar called"
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar(); // executes parent contract, "A.bar called"
    }
}

contract D is B, C {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.

    function foo() public override(B, C) {
        super.foo(); // c.foo called, A.foo called
    }

    function bar() public override(B, C) {
        super.bar(); // c.bar called, b.bar called, a.bar  called.
    }
}