// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract BlockInfo {

    function getBaseFee() public view returns(uint) {
        return block.basefee;
    }

    function getChainId() public view returns(uint) {
        return block.chainid;
    }

    function getCoinbase() public view returns(address payable) {
        return block.coinbase;
    }

    function getDifficulty() public view returns(uint) {
        return block.difficulty;
    }

    function getGaslimit() public view returns(uint) {
        return block.gaslimit;
    }
    function getBlockNumber() public view returns(uint) {
        return block.number;
    }
    

}