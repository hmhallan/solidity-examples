pragma solidity ^0.4.16;

contract MyDestructibleContract {
    
    uint256 counter;
    address owner;

    //modificador que permite apenas o owner executar determinada operação
    modifier onlyowner() {
        if(msg.sender == owner) {
            _;
        }
        else {
            revert();
        }
    }

    //construtor que permite receber ether ao criar o contrato
    constructor () public payable {
        counter = 5;
        
        //construtor somente é chamado ao fazer o deploy do contrato
        //neste momento, o 'sender' é o criador do contrato
        owner = msg.sender;
    }
    
    //setter
    function setCounter( uint256 _counter ) public {
        counter = _counter;
    }
    
    //constant significa que nao tem transacao, nao precisa mineirar (nao usa gas para executar)
    function getCounter() public constant returns (uint256) {
        return counter;
    } 
    
    function getBalance() public onlyowner constant returns (uint256){
        return address(this).balance;
    }
    
    //funcao anonima 'fallback' que é executada quando o contrato recebe ether
    function () public payable {
        
    }
    
    //encerra o contrato (somente o owner pode fazer isso) - modificador onlyowner
    function kill() public onlyowner { 
        selfdestruct(owner); //neste caso, os fundos restantes vão para a conta do owner 
    }

}