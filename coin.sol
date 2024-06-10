// SPDX-License-Identifier: GPL3.0
pragma solidity ^0.8.26;

contract Coin{

    address public  minter;

    mapping(address => uint) public balances;

    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    event Sent(address from, address to, uint amount);

    // error InsufficientAmount(uint requested, uint available);

    function send(address receiver, uint amount) public {
        // require(amount <= balances[msg.sender], InsufficientAmount(amount, balances[msg.sender]));
        require(amount <= balances[msg.sender], "Insufficient Funds");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    } 
}