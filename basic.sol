// SPDX-License-Identifier: GPL3.0
pragma solidity ^0.8.26;

contract SimpleStorage{
    uint myStorage;

    function set(uint x) public{
        myStorage = x;
    }

    function get() public view returns (uint){
        return myStorage;
    }
}
