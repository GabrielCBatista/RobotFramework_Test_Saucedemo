*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/login_saucedemo_resource.robot
Resource            ../resources/produto_saucedemo_resource.robot
Resource            ../support/page_object.robot

*** Keywords ***
Abrir Navegador compra
    Open Browser                        browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Speed                  value=0.1
Inicio do Teste compra
    Go To                               url=${URL}
    Quando eu faço login com um usuário e senha válidos
    Run Keyword And Ignore Error    Click Element        locator=${ADD_1}
    Run Keyword And Ignore Error    Click Element        locator=${ADD_2}
Fim do Teste compra
    Capture Page Screenshot
Fechar Navegador compra
    Close Browser

Dado que estou na tela do carrinho "${TITULO}" com dois itens selecionados
    Click Element                                        locator=${CAR_0}
    Wait Until Page Contains                             text=Swag Labs
    Element Should Be Visible                            locator=//span[@class='title'][contains(.,'${TITULO}')]           
    Wait Until Page Contains Element                     locator=@{LISTA}
    ${quantidade_esperada}         Set Variable          2
    Wait Until Page Contains Element                     locator=(//div[@class='cart_item'])[${quantidade_esperada}]
Quando eu removo um produto do carrinho
    Click Element            ${DELCAR_1}

Então devo ter apenas um item no carrinho
    Click Element                                        locator=${CAR_0}            
    Wait Until Page Contains Element                     locator=@{LISTA}
    ${quantidade_esperada}         Set Variable          1
    Wait Until Page Contains Element                     locator=(//div[@class='cart_item'])[${quantidade_esperada}]

E tenho itens selecionados e na tela de informações do comprador "${TITULO}"
    Run Keyword And Ignore Error    Click Element        locator=${ADD_1}
    Run Keyword And Ignore Error    Click Element        locator=${ADD_2}
    Click Element                                        locator=${BOTAO_CHECK}
    Element Should Be Visible                            //span[@class='title'][contains(.,'${TITULO}')]

Quando informo meu nome completo e endereço postal e clico em "CONTINUE"
    Run Keyword And Ignore Error    Click Element       locator=${BOTAO_CHECK}
    Input Text                                          locator=${CAMPO_NOME1}     text=${FNOME}
    Input Text                                          locator=${CAMPO_NOME2}     text=${LNOME}
    Input Text                                          locator=${CAMPO_CEP}       text=${CEP}
    Click Element                                       locator=${BOTAO_CONT}

Então devo ver a tela de resumo do pedido "${TITULO}"
    Element Should Be Visible                           locator=//span[@class='title'][contains(.,'${TITULO}')]


Quando não informo meu nome com mais de uma palavra e clico em "CONTINUE"
    Click Element                                       locator=${BOTAO_CONT}

Então devo ver a mensagem de erro "${TITULO}"
    Element Should Be Visible                            //h3[@data-test='error'][contains(.,'${TITULO}')]
