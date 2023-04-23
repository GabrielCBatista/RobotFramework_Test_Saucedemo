*** Settings ***
Library             SeleniumLibrary
Resource          ../support/page_object.robot
*** Keywords ***

Inicio do Teste login
    Go To                           url=${URL}
Fim do Teste login
    Capture Page Screenshot
Abrir Navegador login
    Open Browser     	            browser=chrome
    Maximize Browser Window
    Set Selenium Speed              value=0.1
Fechar Navegador login
    Close Browser
Dado que eu estou na página de login que contém o título "${TITULO}"
    Wait Until Page Contains         text=Swag Labs
    Element Should Be Visible        locator=//div[@class='login_logo'][contains(.,'${TITULO}')]
Quando eu tento fazer login sem preencher o campo usuário
    Input Text                       locator=${CAMPO_SENHA}     text=${SENHA}
    Click Element                    locator=${BOTAO_LOGIN}
Então devo ver uma mensagem de erro informando que o usuário é necessário
    Wait Until Element Is Visible    locator=${REQUIRED_USERNAME}

Quando eu tento fazer login sem preencher o campo senha
    Input Text                       locator=${CAMPO_USERNAME}   text=${USERNAME}
    Click Element                    locator=${BOTAO_LOGIN}
Então devo ver uma mensagem de erro informando que a senha é necessária
    Wait Until Element Is Visible    locator=${REQUIRED_PASSWORD}

Quando eu tento fazer login com um usuário e senha inválidos
    Input Text                       locator=${CAMPO_USERNAME}   text=${FNOME}
    Input Text                       locator=${CAMPO_SENHA}      text=${CEP}
    Click Element                    locator=${BOTAO_LOGIN}

Então devo ver uma mensagem de erro informando que o usuário e/ou senha estão incorretos
    Wait Until Element Is Visible    locator=${REQUIRED_USER_PASS}

Quando eu faço login com um usuário e senha válidos
    Input Text                       locator=${CAMPO_SENHA}      text=${SENHA}
    Input Text                       locator=${CAMPO_USERNAME}   text=${USERNAME}
    Click Element                    locator=${BOTAO_LOGIN}
Então devo ver a página principal dos produtos que contém o título "${TITULO}"
    Wait Until Page Contains         text=Swag Labs
    Element Should Be Visible        locator=//span[@class='title'][contains(.,'${TITULO}')]
