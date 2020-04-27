class Simulador
    include Capybara::DSL

    # element :imp_valorAplicar, '#valorAplicar'
    # element :imp_valorInvestir, '#valorInvestir'
    # element :imp_tempo, '#tempo'

    # element :msg_erro, '#valorAplicar-error'

    # element :btn_simular, '.btnSimular'
    # element :btn_limpar, '.btnLimpar'

    def go
        visit "/"
    end

    def inserir_valor_Aplicar(valor)
        find("#valorAplicar").set(valor)
        sleep 2
    end

    def inserir_valor_Investir(valor)
        find("#valorInvestir").set(valor)
        sleep 2
    end

    def inserir_valor_tempo(valor)
        find("#tempo").set(valor)
        sleep 2
    end

    def clicar_simular
        find(".btnSimular").click
    end

    def clicar_limpar
        find(".btnLimpar").click
    end

    def clicar_refazer
        find(".btnRefazer").click
    end

    def msg_erro_campo_aplicar
        find('#valorAplicar-error').text
    end

    def msg_erro_campo_investir
        find('#valorInvestir-error').text
    end

    def msg_erro_campo_tempo
        find('#tempo-error').text
    end

    def selecionar_opcao_Anos
        find('.blocoMeses').click
        sleep 2
        find('a', text: 'Anos').click
    end

    def selecionar_perfil(perfil)
        if (perfil == 'fisico')
            find('input[value=paraVoce]').click
        end
        if (perfil == 'juridico')
            find('input[value=paraEmpresa]').click
        end
    end

    def confere_valor
        find('.valor').text
    end

    def confere_simular
        find(".btnSimular").text
    end
end
