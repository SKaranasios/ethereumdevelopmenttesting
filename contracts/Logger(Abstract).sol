pragma solidity  >=0.4.22 <0.9.0;

//its a way for a designer to say any child of this abstract contract has to implement 
//the method/s

//it provides with function definition
//not neccesary to implement

abstract contract Logger {
    //virtual modifier
    //doesn't have implementation
    function emitLog() external pure virtual returns(bytes32);

    //but we can also create an implemented function
    //or constructors
}