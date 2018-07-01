pragma solidity ^0.4.16;

contract MyContract {
    
    uint256 counter;
    
    address owner = msg.sender; //dono do contrato é o criador


    //construtor
    function construtor() public {
        counter = 5;
    }
    
    //setter
    function setCounter( uint256 _counter ) public {
        counter = _counter;
    }
    
    //constant significa que nao tem transacao, nao precisa mineirar (nao usa gas para executar)
    function getCounter() public constant returns (uint256) {
        return counter;
    } 

}