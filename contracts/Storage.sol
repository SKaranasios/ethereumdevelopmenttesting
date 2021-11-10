pragma solidity >=0.4.22 <0.9.0;

contract Storage {


  //keccak256(key.slot)
  mapping (uint => uint) public aa;//slot 0
  mapping (address => uint) public bb;

  uint[] public cc; //slot2

  uint8 public a = 7; // 1 byte
  uint16 public b = 10; // 2bytes 000a in hex
  address public c = 0x648FaaD551af1DA6d6556f0E3C41B37B6055bAD1; // 20bytes
  bool d = true; // 1 byte
  uint64 public e = 15; // 8bytes
  // 32 bytes, all values will be stored in slot 3

  // 0x0f 01 648faad551af1da6d6556f0e3c41b37b6055bad1 000a 07
    //
  uint256 public f = 200; // 32bytes -> slot 4

  uint8 public g = 40; // 1byte -> slot 5
  //1 byte of g wil take one slot by itself(not good practice) if you want to minimize gas fees
  //ordering matters 

  uint256 public h = 789; // 32bytes -> slot 6


  //in a constructor i can access my storage and assign value to it
  constructor(){
    cc.push(2);
    cc.push(5);

    aa[2] =4;
    aa[3]=10;

    bb[0x4B079A6a870946F0F6EC6bD8cD22cFE7Ea78D250]=100;
    //dynamic values are differently stored in storage
    //first 16 chunk bytes for the key , and then slot number
    //keccak 256(key .value)  to find the slot 
  }
}