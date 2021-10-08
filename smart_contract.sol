// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.1;
//pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    mapping(address => uint256) public balances;
    
    // define a wallet object
    // payable type is needed from solidity 0.5 onward to accept the msg.sender method
    address payable wallet;

    // create an event that allows to listen to new purchases
    // indexed buyer allows us to listen to event relevant to our account
    event Purchase(address indexed _buyer, uint256 _amount);

    // set the constructor of our contract for the wallet object
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

     // create a function to purchase token
    function() external payable {
        buyToken();
    }

    // final scope of our smart contract is here
    // increase balance and emit a purchase msg
    function buyToken() public payable {
        balances[msg.sender]++;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
