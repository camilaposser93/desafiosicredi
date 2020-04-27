# language: pt
Funcionalidade: simulador de investimentos
    Com o propósito de simular um investimento na poupança
    como um associado
    eu gostaria de preencher o formulário de simulação
    e ver a tabela de resultado com Mês e valor

Contexto:
    Dado que acesse o Simulador de Investimento Poupança
    
    @Min
    Cenário: Validar o valor minimo
        Quando preencho os campos obrigatórios com valor abaixo do minimo
        Então deve retornar a mensagem "Valor mínimo de 20.00" para o campo valor aplicar
        E deve retornar a mensagem "Valor mínimo de 20.00" para o campo valor investir
    

    @Max
    Cenário: Validar o valor maximo
        Quando preencho os campos obrigatórios com valor acima do maximo 
        Então deve retornar a mensagem "Máximo de 9999999.00" para o campo valor aplicar
        E deve retornar a mensagem "Máximo de 9999999.00" para o campo valor investir


    @CampoObrigatorio
    Cenário: Validar campos obrigatorios
        Quando não preencho os campos obrigatorios
        Então deve retornar a mensagem "Obrigatório" para o campo tempo


    @ValorEsperado
    Cenário: Validar valor esperado para o campo tempo com a opção Anos
        Quando seleciono a opção Anos
        E informar um valor incorreto
        Então deve retornar a mensagem "Valor esperado não confere" para o campo tempo


    @SimulacaoCorreta
    Esquema do Cenário: Validar a simulação com dados corretos
        Quando preencho os campos corretamente para o "<perfil>"
        Então a simulação é gerada corretamente
        Exemplos:
            | perfil   |
            | fisico   |
            | juridico |

    @RefazerSimulação
    Cenário: Validar a opção de refazer simulação
        Quando refaço a simulação
        Então deve voltar para tela onde preencho os campos        

