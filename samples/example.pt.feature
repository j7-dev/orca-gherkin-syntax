# language: pt
@checkout @smoke
Funcionalidade: Fechamento do carrinho de compras
  Como comprador
  Eu quero pagar pelos itens do meu carrinho

  Contexto:
    Dado que a loja tem os seguintes produtos:
      | nome   | preço |
      | Maçã   | 1,50  |
      | Banana | 0,75  |

  Regra: Só é possível fechar um carrinho que não esteja vazio

    @caminho-feliz
    Esquema do Cenário: Pagando por <quantidade> maçãs
      Dado que adiciono <quantidade> "Maçã" ao carrinho
      Quando fecho a compra com o cartão "4242 4242 4242 4242"
      Então o total deve ser <total>
      E devo receber um recibo:
        """json
        { "itens": <quantidade>, "total": <total> }
        """
      Mas nenhum e-mail é enviado se <quantidade> for 0

      Exemplos:
        | quantidade | total |
        | 1          | 1,50  |
        | 3          | 4,50  |

    Cenário: Carrinho vazio
      * fecho a compra
      Entao vejo a mensagem 'Seu carrinho está vazio'
