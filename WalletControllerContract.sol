pragma solidity ^0.4.16;

import "https://github.com/hmhallan/solidity-examples/MortalNotPayable.sol";

contract WalletControllerContract is MortalNotPayable {
    
    //mapa de enderecos com permissões
    mapping(address => Permissao) mapEnderecos;
    
    //estrutura de dados
    struct Permissao {
        bool permitido;
        uint maxValor;
    }
    
    function adicionarEnderecoNaListaDePermitidos( address endereco, uint maxValor ) public onlyowner {
        mapEnderecos[endereco] = Permissao(true, maxValor);
    }
    
    function removerEnderecoNaListaDePermitidos( address endereco ) public onlyowner {
        mapEnderecos[endereco].permitido = false;
    }
    
    function enviarFundos( address destino, uint valorEmEther ) public {
        if ( mapEnderecos[msg.sender].permitido ){
            if ( mapEnderecos[msg.sender].maxValor >= valorEmEther ){
                destino.transfer( valorEmEther );
            }
        }
    }
    
    function() public payable {
        
    }

}