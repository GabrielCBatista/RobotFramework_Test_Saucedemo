*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/login_saucedemo_resource.robot
Resource            ../support/page_object.robot

*** Keywords ***
Abrir Navegador produto
    Open Browser                        browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Speed                  value=0.1

Inicio do Teste produto
    Go To                           url=${URL}
    Quando eu faço login com um usuário e senha válidos
    
Fim do Teste produto
    Capture Page Screenshot
    Run Keyword And Ignore Error    Click Element    locator=${DEL_1}
    Run Keyword And Ignore Error    Click Element    locator=${DEL_2}
Fechar Navegador produto
    Close Browser

Dado que estou na tela de produtos
# Realizar o login
    Wait Until Page Contains Element    css=.product_sort_container
    Wait Until Page Contains Element    css=.inventory_item_name
    Wait Until Page Contains Element    css=.inventory_item_price
    Title Should Be                     Swag Labs

Dado que estou na tela de produtos e verifico de o título é "${TITULO}"
    Wait Until Page Contains Element    css=.product_sort_container
    Wait Until Page Contains Element    css=.inventory_item_name
    Wait Until Page Contains Element    css=.inventory_item_price
    Wait Until Page Contains            text=Swag Labs
    Element Should Be Visible           locator=//span[@class='title'][contains(.,'${TITULO}')]

Quando clico na opção de ordenar de Z a A
    Click Element                        locator=${CONTAINER}
    Select From List By Value            //select[@class='product_sort_container']      az

Então os produtos devem estar ordenados de Z a A
    Wait Until Page Contains             text=${NOME_ZA}

Quando clico na opção de ordenar de preço baixo a alto
    Click Element                        locator=${CONTAINER}
    Select From List By Value            //select[@class='product_sort_container']      lohi

Então os produtos devem estar ordenados de preço baixo a alto
    Wait Until Page Contains             text=${PRECO_BAIXO_ALTO}

Quando clico na opção de ordenar de preço alto a baixo
    Click Element                        locator=${CONTAINER}
    Select From List By Value            //select[@class='product_sort_container']      hilo

Então os produtos devem estar ordenados de preço alto a baixo
    Wait Until Page Contains             text=${PRECO_ALTO_BAIXO}

Quando clico na opção de ordenar de A a Z
    Click Element                        locator=${CONTAINER}
    Select From List By Value            //select[@class='product_sort_container']      az

Então os produtos devem estar ordenados de A a Z
    Wait Until Page Contains             text=${NOME_AZ}

Quando adiciono dois item no carrinho
    Click Element                        locator=${ADD_1}
    Click Element                        locator=${ADD_2}
    Wait Until Element Is Visible        locator=${CAR_0}
Então a imagem do carrinho deve exibir o número de dois selecionados
    Wait Until Element Is Visible        locator=${CAR_2}

E removo os dois item do carrinho
    Click Element                        locator=${DEL_1}
    Click Element                        locator=${DEL_2}

Então a imagem do carrinho deve estar vazio
    Wait Until Element Is Visible        locator=${CAR_0}