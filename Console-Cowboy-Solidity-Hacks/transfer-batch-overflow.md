* Overflow conditions often happen in situations where you are sending a batched amount of values to multiple recipients.
* If you are performing an airdrop, sending tokens to 200 users, each receiving a large sum of tokens, checking the total sum of all users’ tokens against the total funds may trigger an overflow
* The logic when overflowed would compare a smaller value of overflowed tokens to the total tokens and seem like you have enough to cover the transaction.

```
For example, if your integer can only hold 5 digits in length or 00,000 what would happen in the below scenario?

You have 10,000 tokens in your account

You are sending 200 users 499 tokens each

Your total sent is 200*499 or 99,800
```