//artifacts is the json file that has binary of contract 
//and other details
const FaucetContract = artifacts.require("Faucet")

//setting  contract  to deploy
module.exports = function(deployer){
    deployer.deploy(FaucetContract)
}