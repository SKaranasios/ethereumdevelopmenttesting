//artifacts is the json file that has binary of contract
const FaucetContract = artifacts.require("Faucet")

//setting which contract we want to deploy
module.exports = function(deployer){
    deployer.deploy(FaucetContract)
}