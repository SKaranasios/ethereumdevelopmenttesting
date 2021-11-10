pragma solidity  >=0.4.22 <0.9.0;

contract Test{
    //call stack contain signature of function in butecode
    function test(uint testNum) external pure returns(uint data){
        
        //can write assembly to access specified offsets of bytes on the memory
        //more control over your resources
        assembly {
            mstore(0x40,0xd2) //d2 in hex is 210 in dec
            //storing values on these location
            //0xd2 --210 
            //so it will be storing the value in 210 position
            //32 chunk  bytes are  allocated for this


        }
        
        uint8[3] memory items = [1,2,3];

        //should return data on these memory location
        //decoded output in remix
        assembly {
            //data :=mload(0x90) --position1
            data := mload(add(0x90,0x20)) //next position in memory(32 bytes)
        

        }
    }

    function test2() external pure returns (uint data){


        assembly {
            //free memory pointer
            let fmp := mload(0x40)
            //hello add()  --initial asset plus offset
            mstore (add(fmp,0x00),0x00)
            //will return unit so value of decimal number
            data := mload(add(fmp,0x00))
        }
    
    }


}



//	"0x0": "00000000000000000000000000000000,


