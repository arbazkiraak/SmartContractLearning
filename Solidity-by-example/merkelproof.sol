pragma solidity ^0.7.6;

// https://www.youtube.com/watch?v=fB41w3JcR7U
// tree is constructed by taking pair of data and hashing it, repeating the same process until we end up with last hash.
// tree continously grows as we have more blocks.
// would work with 2^ of array length only. ex: 2,4,8 but not 6
// to create a crypto proof that txt is in the block.


// tee of 2 will have 1 branch i.e root  
// tree of 4 will have 1  branch and  then 1 root. : 4 -> 2 -> 1
// tree of 6 will have 3  branch but fails here because it failed to find pair for branch because: 6 -> 3 -> ?? (can't make 2 pairs so failed)
// tree of 8 will have 4 branch then 2 branch then 1 root : 8 ->  4 -> 2 -> 1 

// ex: 8 block size : [address1,address2,address3,address4,address5,addres6,address7,address8]
// we first take address1 and 2 and compute the hash and store agian in array which is called as leafs. 
//                    [hash12,hash34,hash56,hash78] // again we repeat the same process until end up  with  one  hash (i.e root of tree)

contract MerkleProof {
    // merkletree which contains all txts, merkelroot hash which is last computate root hash, hash of the element in the array stored,index of the element where the leaf is stored)
    function verify(bytes32[] memory proof,bytes32 root,bytes32 leaf,uint index) public pure returns (bool){
        
        bytes32 hash = leaf; //  `hash or txt` to find in merkel tree
        
        //  recompute merkle root until it hits root.
        
        for (uint i=0; i < proof.length; i++){
            // if the index is even , ex: 2,4,6, which means hash belongs to  left branch in merkle tree.
            if (index % 2 == 0){ 
                hash = keccak256(abi.encodePacked(hash,proof[i])); 
            } else { // if the index is odd , ex: 3,5,7 which means that hash belongs to right branch
                hash = keccak256(abi.encodePacked(proof[i],hash));
            }
            
            index = index / 2; // make index div by 2, to round down to nearest integer
        }
        
        return hash == root;
    }
        
}


contract TestMerkleProof is MerkleProof {
    bytes32[] public hashes; // merkel tree
    
    constructor() {
        string[4] memory transactions = [
            "alice -> bob",
            "bob -> dave",
            "carol -> alice",
            "dave -> bob"
        ];
        
        // pushing the transactions into the merkle tree which intialize our starting array.
        for (uint i = 0; i < transactions.length; i++) {
            hashes.push(keccak256(abi.encodePacked(transactions[i])));
        }
        
        // now keep computing the txts in pairs until we reach root ex: 4 -> 2 -> 1
        
        uint n = transactions.length;
        uint offset = 0;

        while (n > 0) {
            for (uint i = 0; i < n - 1; i+=2) {
                hashes.push(
                    keccak256(abi.encodePacked(
                        hashes[offset + i],
                        hashes[offset + i + 1]
                    ))
                );
            }
            offset += n;
            n = n / 2;
        }
    }
    
    
    // get the length of the merkle tree
    function getlength() public view returns (uint){
        return hashes.length;
    }
    
    // get the root by taking last element i.e root
    function getRoot() public view returns (bytes32) {
        return hashes[hashes.length - 1];
    }
    
    /* verify
    3rd leaf
    0x1bbd78ae6188015c4a6772eb1526292b5985fc3272ead4c65002240fb9ae5d13 

    root
    0x074b43252ffb4a469154df5fb7fe4ecce30953ba8b7095fe1e006185f017ad10 // hash of computing  last 2 leafs

    index
    2

    proof which ie "merkeltree"
    0x948f90037b4ea787c14540d9feb1034d4a5bc251b9b5f8e57d81e4b470027af8 // hash of computing 4 element
    0x63ac1b92046d474f84be3aa0ee04ffe5600862228c81803cce07ac40484aee43 // hash of computer 1,2
    */
}