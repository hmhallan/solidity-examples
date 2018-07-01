pragma solidity ^0.4.16;

//caminho no github: https://github.com/<owner>/<repo>/<path to the file>
import "https://github.com/hmhallan/solidity-examples/Mortal.sol";

contract MyImportFromGithubContract is Mortal {
    
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