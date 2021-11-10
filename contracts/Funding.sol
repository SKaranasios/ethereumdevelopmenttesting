pragma solidity  >=0.4.22 <0.9.0;

/*so here we want to create a contract who can recieve funds from accounts
and through web 3 get all funders and funder at specific  index 

if we create a address[] memory duplicates will be possible so we will create a mapping(key,value)
*/


contract Funding{
    //creating receive special function in order for our contract be able to accept payments
    //payable modifier
    receive() external payable{}

    //setting unit to index the  _funders
    mapping(address => bool) private funders;
    //creeting _funders to index addresses of funders
    mapping(uint => address) private lutfunders;
    uint public numOfFunders;


    function addFunds() external payable{
        
        //should create a address object for key value which will be msg.sender
        address key =msg.sender;external
        //check if key value exists inside mapping  and add it

        if(!funders[key]){
            //index increases after first iteration
            uint index = numOfFunders++;
        
            funders[key]=true;
            lutfunders[index]= key;
        }
    }



    //public to be able to called by other functions withing smart contract
    //view, access storage but not modifying it
    function getAllFunders() public view returns(address[] memory){
        
        //creating address[] to return 
        address[] memory _funders= new address[](numOfFunders);

        
         //iteration for passing mapping key value  to address[]
        for (uint i=0 ; i<numOfFunders ; i++){
            _funders[i]=lutfunders[i];

        }
        //should return address[] but _funders are mapping
        return  _funders;
    }

}

function getFundersAtIndex(uint index) public view returns(address[] memory){
    //_funders is not accesible/visible outside of function , but  function getallFunders() is public and returns the _funders
    address[] memory _indexfunders = getAllFunders();

    return _indexfunders[index];
}

//const instance = await Faucet.deployed()
//instance.addFunds({from: , value:})
//instance.getAllFunders()