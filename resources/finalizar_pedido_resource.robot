*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/login_saucedemo_resource.robot
Resource            ../resources/produto_saucedemo_resource.robot
Resource            ../resources/compra_saucedemo_resource.robot
Resource            ../support/page_object.robot

*** Keywords ***
Abrir Navegador finalizar
    Open Browser                        browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Speed                  value=0.1
Inicio do Teste finalizar
    Go To                               url=${URL}
    Quando eu faço login com um usuário e senha válidos
    Run Keyword And Ignore Error    Click Element        locator=${ADD_1}
    Run Keyword And Ignore Error    Click Element        locator=${ADD_2}
    Click Element                       ${CAR_0}
    Click Element                       ${BOTAO_CHECK}
    Quando informo meu nome completo e endereço postal e clico em "CONTINUE"
Fim do Teste finalizar
    Capture Page Screenshot
Fechar Navegador finalizar
    Close Browser

Dado que estou na tela do pedido "${TITULO}" com dois itens selecionados
    Element Should Be Visible                            //span[@class='title'][contains(.,'${TITULO}')]      
    Wait Until Page Contains Element                     locator=@{LISTA}
    ${quantidade_esperada}         Set Variable          2
    Wait Until Page Contains Element                     locator=(//div[@class='cart_item'])[${quantidade_esperada}]               

Então devo ver o nome e o preço de cada produto no resumo e o subtotal, imposto e total do pedido
    ${VALOR_1} =  Get Text                               ${LOCALIZADOR_PRECO1}
    Log  Valor do item 1: ${VALOR_1}
    ${VALOR_2} =  Get Text                               ${LOCALIZADOR_PRECO2}
    Log  Valor do item 2: ${VALOR_2}
    ${TAXA} =  Get Text                                  ${LOCALIZADOR_IMPOSTO}
    Log  Valor da taxa: ${TAXA}
    ${VALOR_TOTAL} =  Evaluate                           ${VALOR_1.replace('$','').replace(',','')} + ${VALOR_2.replace('$','').replace(',','')} + ${TAXA.replace('Tax: $','').replace(',','')}
    Log  Valor total: ${VALOR_TOTAL}
    ${VALOR_ESPERADO} =  Get Text                        ${VALOR}
    Should Be Equal As Numbers  ${VALOR_TOTAL}           ${VALOR_ESPERADO.replace('Total: $','').replace(',','')}

Quando confirmo o pedido de compra
    Click Element                                        ${FINISH}

Então devo ver a mensagem "${TITULO}" na tela
    Wait Until Page Contains Element                     //h2[@class='complete-header'][contains(.,'${TITULO}')]