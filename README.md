NOTES:

--------

Solidity code -> compiles to bytecode -> EVM can understand only bytecode and process the instructions in Assembly.

--------

1. get the amount of ether stored in this contract

```
uint amount = address(this).balance;
```

2. send ether to other address

```
address payable public owner;

uint amount = address(this).balance; // get total balance of ether in current SC
(bool success,) = owner.call{value: amount}("");
require(sucess,"Failed to  send ether to owner")
```

> Caller methods

```
msg.data (bytes): complete calldata
msg.gas (uint): remaining gas.
msg.sender (address): send of the message (current call) : address of the caller or sender to sended eth to our SC address.
msg.sig (bytes4): first four bytes of  the calldata
msg.value (uint): number of wei send with the message : number of wei sent by the caller.

msg.value is automatically set to the amount of ether sent with that payable function.

gasleft() : (uint) : number of remaining gas

```

-----


```
address(0) -> is same as 0x0 an uniniatialized address ex: 0x0000000000000000
balances[address(0)] then means how many tokens the address 0 (0x00000000...00) owns.

address(this) -> address of the current Smart contract deployed.
address(this).balance -> total balance amount of the current smart contract
```

-----

Transactions properities : 

```
block.number (uint) : current block number
block.timestamp (uint) : current block timestamp as seconds since uinx epoch
block.gaslimit  (uint) : current block gaslimit
block.difficuly (uint) : current block difficulty
block.coinbase  (address) : current block miner's address

block.blockhash(uint blockNumber) returns (bytes32) : takes blocknumber as input, returns hash of the given block.

now(uint) : current block timestampt, same to (block.timestamp)

tx.gasprice (uint) : gas price of the transaction
tx.origin (address) : sender of the transaction address

```


-----

```
msg.sender.transfer(1000); // transfer the 1000 wei from SC to the caller address who called the function
msg.sender.transfer(address(this).balance) // transfer all the SC balance amount to  the function caller address.
```
-----

* ABI works similar like api, to call functions,variables to get information about those

```

call function has a api called "abi.encodeWithSignature"

first arg: is function structure along with arguments.
second arg: arguments values 

1. _addr.call{value:msg.value,gas:5000}(
	abi.encodeWithSignature("somepublicfunction(string,uint256)","this is a string",1337) 
)

```

------------------

Hashing:

Keccak-256

* Like any hash, it has an infinite input space. This enables one to "make a hash" of a super large file. The hash should entirely change if a single bit of data in the source is different - unlike say a CRC32, or a checksum. It means your password could be a million chars long maybe. It's stored on disk as a hash, much smaller in size. fixed length

https://emn178.github.io/online-tools/keccak_256.html

-------------------------

https://www.w3schools.com/java/java_data_types.asp -> boolean takes 1 bit

Bitfields are to used memory in more efficient way:

In solidity `bool` is stored in 1byte(8 bits), However single bit can actually used.  
hex value of `true` is `0x01` and `false` is `0x00` converted to binary these are `00000001` and `00000000` where 7 of the total 8 bits are not used.
