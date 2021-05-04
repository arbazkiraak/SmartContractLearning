
* Integer overflow and underflow occur when user supplied data controls the value of a unsigned integer `uint`.
* The user supplied data either adds to or subtracts beyond the limits the variable type can hold.
* Each variable can hold up to a certain value length. 
* Some variables can hold only positive numbers ex: unsigned `uint` where signed `int` can hold both positive and negative number.

-----

Example : 
* If you were calculating a number for an authorization check within  an application and calculation contains an unchecked value within an application.
*  Then an attacker may be able to bypass authorization restrictions with that user-controlled data and gain additional access to unintended services. 
* For example, overflowing a larger unsigned value to more advantageous value such as zero or one., these lower values could bypass security checks.
* The first (“1”) value in a dataset is often indicative of an administrator who set up the application and may create a situation to persist actions with administrative context.

-------

* In the Solidity language for Ethereum, when we overflow a uint value using a value larger than our uint can hold, the value wraps back around to a number it understands
* The lowest or highest possible value the uint can hold. For example, if we have a variable that can only hold a 2-digit number when the number 99 is reached and then incremented one more time, we will end up with 00
* Inversely if we had 00 and we decremented 1 we would end up with 99.

```
Normally in your math class the following would be true:

99 + 1 = 100

00 - 1 = -1


In solidity with unsigned numbers the following is true:

99 + 1 = 00

00 - 1 = 99
```

-------------------------------

Example code:

```
1.  require (balance - withdraw_amount > 0);
```

* If the user balance - withdrawl amount supplied by the user is less than 0 then user doesn't have money for this transaction.
* This transaction should fail and produce an error because not enough funds are held within the account for the transaction. 

Lets suppose user have balance of 5$ and heis withdrawing 6$

```
Let's do some math.

5 - 6 = 99
```

Last I checked 99 is greater than 0 which poses an interesting problem. Our check says we are good to go, but our account balance isn't large enough to cover the transaction. The check will pass because the underflow creates the wrong value which is greater than 0 and more funds then the user has will be transferred out of the account.

Leads to following condition true.

``
require (99 > 0)
```

> Withdrawl function vulnerable to an underflow:

```
    function withdraw(uint withdraw_amount) public {
        // condition  check with user balance - user input, here user input could trigger a vulnerability by making underflow condition
        require(balances[msg.sender] - withdraw_amount >  0);
        msg.sender.transfer(withdraw_amount);
        balances[msg.sender] -= withdraw_amount;
    }
```

* line2 checks that the  balance of caller address is > 0 after substrating  the withdrawl amount to make sure if the user have enough amount stored on SC to withdraw.
* If the amount is  greater than balance, then withdraw.
* Problem here is it would result in underflow if the withdrawl amount is > user balance on SC.

* Depending on how the “require” check and transfer functions are coded, the attacker may not lose any funds at all, while still transferring large sums of Ether to other accounts under the attacker’s control. The attacker would achieve this by simply under flowing the require statements which checks the account balance before transferring funds each time.




