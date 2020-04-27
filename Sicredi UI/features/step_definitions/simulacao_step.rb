Dado('que acesse o Simulador de Investimento Poupança') do
    @simular.go
end


Dado('preencho os campos obrigatórios com valor abaixo do minimo') do
    @simular.inserir_valor_Aplicar('20')
    @simular.inserir_valor_Investir('20')
    @simular.inserir_valor_tempo('5')

    @simular.clicar_simular
end


Quando('preencho os campos obrigatórios com valor acima do maximo') do
    @simular.inserir_valor_Aplicar('999999999')
    @simular.inserir_valor_Investir('999999999')
    @simular.inserir_valor_tempo('5')

    @simular.clicar_simular
end


Quando("não preencho os campos obrigatorios") do
    @simular.inserir_valor_Aplicar('20000')
    @simular.inserir_valor_Investir('20000')

    @simular.clicar_simular
end


Quando("seleciono a opção Anos") do                                        
    @simular.selecionar_opcao_Anos
end        

                                                                               
Quando("informar um valor incorreto") do                                     
    @simular.inserir_valor_tempo('999')
    @simular.clicar_simular
end   


Quando("os campos estiverem preenchidos") do                                 
    @simular.inserir_valor_Aplicar('20000')
    @simular.inserir_valor_Investir('20000')
    @simular.inserir_valor_tempo('5')
end                                                                          
                                                                  

Quando("preencho os campos corretamente para o {string}") do |perfil|                                 
    @simular.seleciona_perfil(perfil)
    step 'os campos estiverem preenchidos'
    @simular.clicar_simular
end      


Quando("refaço a simulação") do
    step 'os campos estiverem preenchidos'
    @simular.clicar_simular
    @simular.clicar_refazer
end


Então("deve voltar para tela onde preencho os campos") do
    expect(@simular.confere_simular).to eql 'SIMULAR'
end


Então("a simulação é gerada corretamente") do                                
    expect(@simular.confere_valor).to eql 'R$ 1.207'
end                                                                                                                                                  
        

Então('deve retornar a mensagem {string} para o campo valor aplicar') do |mensagem|
    expect(@simular.msg_erro_campo_aplicar).to eql mensagem
end


Então('deve retornar a mensagem {string} para o campo valor investir') do |mensagem|
    expect(@simular.msg_erro_campo_investir).to eql mensagem
end


Então('deve retornar a mensagem {string} para o campo tempo') do |mensagem|
    expect(@simular.msg_erro_campo_tempo).to eql mensagem
end