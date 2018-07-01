pragma solidity ^0.4.16;

contract Mortal {
    
    address owner;
    
    modifier onlyowner() {
        if(msg.sender == owner) {
            _;
        }
        else {
            revert();
        }
    }
    
    constructor () public payable {
        owner = msg.sender;
    }
    
    function kill() public onlyowner { 
        selfdestruct(owner);
    }
    
    function () public payable {
        
    }
}