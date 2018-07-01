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

contract MyInheritanceContract is Mortal {
    
    uint256 counter;
    
    constructor () public payable {
        counter = 5;
    }
    
    function setCounter( uint256 _counter ) public {
        counter = _counter;
    }
    function getCounter() public constant returns (uint256) {
        return counter;
    } 
    
    function getBalance() public onlyowner constant returns (uint256){
        return address(this).balance;
    }

}