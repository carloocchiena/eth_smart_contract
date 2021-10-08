// SPDX-License-Identifier: MIT-Modern-Variant

pragma solidity ^0.5.1;
//pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    // create a mapping function to track the token balances
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

     // create a fall-back function to purchase token
     // note: Fallback functions are executed whenever a particular contract receives plain Ether without any other data associated with the transaction.
    function() external payable {
        buyToken();
    }

    // final scope of our smart contract 
    // increase balance and emit a purchase msg
    function buyToken() public payable {
        balances[msg.sender]++;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
