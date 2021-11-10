pragma solidity  >=0.4.22 <0.9.0;

contract Test{
    function test(uint testNum) external pure returns(uint){
        
        //can write assembly to access specified offsets of bytes on the memory
        //more control over your resources
        assembly {
            let _num := 4
            let _fmp := mload(0x40)

        }
        return testNum;
    }
}

