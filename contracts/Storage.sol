pragma solidity >=0.4.22 <0.9.0;

contract Storage {

  uint8 public a = 7; // 1 byte
  uint16 public b = 10; // 2bytes 000a in hex
  address public c = 0x648FaaD551af1DA6d6556f0E3C41B37B6055bAD1; // 20bytes
  bool d = true; // 1 byte
  uint64 public e = 15; // 8bytes
  // 32 bytes, all values will be stored in slot 0

  // 0x0f 01 648faad551af1da6d6556f0e3c41b37b6055bad1 000a 07
    //000000000000000f
  uint256 public f = 200; // 32bytes -> slot 1

  uint8 public g = 40; // 1byte -> slot 2
  //1 byte of g wil take one slot by itself(not good practice) if you want to minimize gas fees
  //ordering matters 

  uint256 public h = 789; // 32bytes -> slot 3


}