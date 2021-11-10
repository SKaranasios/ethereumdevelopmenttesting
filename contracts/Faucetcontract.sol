pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    //private -> can only be accesed within smart contract
    //internal -> can be accesible within smart contract and also derived smart contract
    //public will be part of abi/part of interface
    address[] public funders;


    //special function
    //its called when you make a transaction that doesn't specify
    //function name to call(name(function))
 
    //exteranl function are part of the cotnract interface
    //which means they can be called via contracts and othere transactions


//receive and addFUnds are special functions
    receive() external payable{}

    function addFunds() external payable {
        funders.push(msg.sender);
    }


    //not pure 
    function getAllFunders() public view returns(address[] memory){
        return funders;       
    }

    //external vs public
    //public can be used also within smart contract
    //if externall is used should specify .this but higher gas consumption will be causes

    function getFunderAtIndex(uint8 index) external view returns(address) {
        address[] memory _funders = getAllFunders();
        return _funders[index];

    //const instance = await Faucet.deployed()
    //instance.addFunds({from: , to:})
    //instance.getAllFunders()
    

    }




//pure,view -  read-only call, no gas fee
//view --it indicates that the function will not elter 
//the storage state
//pure --even mote strict , won;t ever read the storage state

//to talk to node on the network you can make json-rpc http calls
}

//const instance = await Faucet.deployed() 
