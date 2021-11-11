pragma solidity >=0.4.22 <0.9.0;

import "./Logger.sol";

contract Faucet  is Logger {
    //private -> can only be accesed within smart contract
    //internal -> can be accesible within smart contract and also derived smart contract
    //private and iternal will not be in faucet.abi(json file)/interface
    //public will be part of abi/part of interface and created getter automatically
    //address[] public funders;


    uint public numOfFunders;
    // can prevent duplication of addresses
    //mapping(uint => address) public funders;
    //NOW KEYS ARE ADDRESSES AND CANNOT BE DUPLICATED
    mapping(address => bool) private funders;

    mapping(uint=> address) private lutFunders;
    //special function
    //its called when you make a transaction that doesn't specify
    //function name to call(name(function))
 
    //exteranl function are part of the cotnract interface
    //which means they can be called via contracts and othere transactions


    //implementing abstract contract function
    function emitLog() public override pure  returns(bytes32){
        return "Hello world";
    }

//receive and addFUnds are special functions
    receive() external payable{}

    function addFunds() external payable {
        //assigning then incrementing
        uint index = numOfFunders++;
        address funder = msg.sender;
    
        if(!funders[funder]){
        
            //numOfFunders++;
            //increment after first execution, we want first "slot" to be 0
            uint index = numOfFunders++;

            funders[funder] = true;
            //create 
            lutFunders[numOfFunders]= funder;
        }
        //funders[index] = msg.sender;
    }
    //addFUnds is a set of instructions in bytecode executed by evm

    //specify ammount
    function withdraw(uint withdrawAmmount) external   {
        //we can also create a modifier for the requiere function and use it to note repeat code
        require(withdrawAmmount <= 100000000000000000 , "Cannot withdraw mote than 0.1 ether");
        //if we have no funds it should throw error
        //set a limit for ammount 
        //if(withdrawAmmount < 1000000000000000000 )
        payable(msg.sender).transfer(withdrawAmmount);
        //transfer should be payable
        
        
    }

    //not pure 
    //will not work with mapping
    //to get all funders need to create new address[]and with a for lopp itetrate
    //through values of mapping and passing them to memory address[]
     function getAllFunders() public view returns(address[] memory){
        address[] memory _funders = new address[](numOfFunders);
        for(uint i = 0;i < numOfFunders ; i++){
            _funders[i] = lutFunders[i];
        }
        return _funders;
    //     return funders;       
    
    }


    //external vs public
    //public can be used also within smart contract
    //if externall is used should specify .this but higher gas consumption will be causes

    function getFunderAtIndex(uint8 index) external view returns(address) {
        //address[] memory _funders = getAllFunders();
        // return funders[index];

    //web3 
    //const instance = await Faucet.deployed()
    //instance.addFunds({from: , value:})
    //instance.getAllFunders()
    

    }




//pure,view -  read-only call, no gas fee
//view --it indicates that the function will not elter 
//the storage state
//pure --even mote strict , won;t ever read the storage state

//to talk to node on the network you can make json-rpc http calls
}

