pragma solidity ^0.4.16;

contract MortalNotPayable {
    
    address owner;
    
    modifier onlyowner() {
        if(msg.sender == owner) {
            _;
        }
        else {
            revert();
        }
    }
    
    constructor () public {
        owner = msg.sender;
    }
    
    function kill() public onlyowner { 
        selfdestruct(owner);
    }

}