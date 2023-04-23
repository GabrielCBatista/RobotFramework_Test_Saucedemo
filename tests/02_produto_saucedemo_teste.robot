*** Settings ***
Documentation       Este arquivo contém os casos de teste automatizados
...                 para a execução correta do teste, é necessário ter as bibliotecas atualizadas do pip: 
...                 robotframework, seleniumlibrary e requests. Além disso, o chromedriver deve estar dentro
...                 de um arquivo que esteja adicionado ao caminho dentro das variáveis de ambiente (Path) e
...                 deve ser a mesma versão do navegador padrão.
...                 Certifique-se de ter seguido esses pré-requisitos antes de executar o teste.

Resource          ../resources/produto_saucedemo_resource.robot

Suite Setup        Abrir Navegador produto
Test Setup         Inicio do Teste produto
Test Teardown      Fim do Teste produto
Suite Teardown     Fechar Navegador produto


*** Test Cases ***
Cenario 1 - Ordenar de Z a A
    [Documentation]     Teste para verificar a ordenação dos produtos de Z a A
    [Tags]              Z_A_Order
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando clico na opção de ordenar de Z a A
    Então os produtos devem estar ordenados de Z a A

Cenario 2 - Ordenar de preço baixo a alto
    [Documentation]     Teste para verificar a ordenação dos produtos de preço baixo a alto
    [Tags]              Preco_Baixo_Alto_Order
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando clico na opção de ordenar de preço baixo a alto
    Então os produtos devem estar ordenados de preço baixo a alto

Cenario 3 - Ordenar de preço alto a baixo
    [Documentation]     Teste para verificar a ordenação dos produtos de preço alto a baixo
    [Tags]              Preco_Alto_Baixo_Order
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando clico na opção de ordenar de preço alto a baixo
    Então os produtos devem estar ordenados de preço alto a baixo

Cenario 4 - Ordenar de A a Z
    [Documentation]     Teste para verificar a ordenação dos produtos de A a Z
    [Tags]              A_Z_Order
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando clico na opção de ordenar de A a Z
    Então os produtos devem estar ordenados de A a Z

Cenario 5 - Adicionar mais de um item no carrinho
    [Documentation]     Teste para verificar a adição de mais de um item no carrinho
    [Tags]              Add_to_Cart
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando adiciono dois item no carrinho
    Então a imagem do carrinho deve exibir o número de dois selecionados

Cenario 6 - Remover itens do carrinho
    [Documentation]     Teste para verificar a remoção de itens do carrinho
    [Tags]              Remove_from_Cart
    Dado que estou na tela de produtos e verifico de o título é "Products"
    Quando adiciono dois item no carrinho
    E removo os dois item do carrinho
    Então a imagem do carrinho deve estar vazio