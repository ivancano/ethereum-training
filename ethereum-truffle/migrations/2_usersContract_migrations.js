let UsersContracts = artifacts.require("UsersContract");

module.exports = function(deployer) {
    deployer.deploy(UsersContracts);
}