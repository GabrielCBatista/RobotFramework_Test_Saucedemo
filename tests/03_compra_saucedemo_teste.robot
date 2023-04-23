*** Settings ***
Documentation       Este arquivo contém os casos de teste automatizados
...                 para a execução correta do teste, é necessário ter as bibliotecas atualizadas do pip: 
...                 robotframework, seleniumlibrary e requests. Além disso, o chromedriver deve estar dentro
...                 de um arquivo que esteja adicionado ao caminho dentro das variáveis de ambiente (Path) e
...                 deve ser a mesma versão do navegador padrão.
...                 Certifique-se de ter seguido esses pré-requisitos antes de executar o teste.
Resource            ../resources/login_saucedemo_resource.robot
Resource            ../resources/produto_saucedemo_resource.robot
Resource            ../support/page_object.robot
Resource            ../resources/compra_saucedemo_resource.robot
Suite Setup         Abrir Navegador compra
Test Setup          Inicio do Teste compra
Test Teardown       Fim do Teste compra
Suite Teardown      Fechar Navegador compra

*** Test Cases ***
Cenário 1: É possível remover o produto do carrinho
    [Documentation]     Como usuário, quero remover um produto do carrinho
    [Tags]              remove-product
    Dado que estou na tela do carrinho "Your Cart" com dois itens selecionados
    Quando eu removo um produto do carrinho
    Então devo ter apenas um item no carrinho

Cenário 2: Usuário deve informar o nome completo e endereço postal para envio do pedido
    [Documentation]     Como usuário, quero informar meu nome completo e endereço postal para envio do pedido
    [Tags]              address-info
    Dado que estou na tela do carrinho "Your Cart" com dois itens selecionados
    E tenho itens selecionados e na tela de informações do comprador "Checkout: Your Information"
    Quando informo meu nome completo e endereço postal e clico em "CONTINUE"
    Então devo ver a tela de resumo do pedido "Checkout: Overview"

Cenário 3: Os campos não estão preenchidos
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra
    [Tags]              name-validation
    Dado que estou na tela do carrinho "Your Cart" com dois itens selecionados
    E tenho itens selecionados e na tela de informações do comprador "Checkout: Your Information"
    Quando não informo meu nome com mais de uma palavra e clico em "CONTINUE"
    Então devo ver a mensagem de erro "Error: First Name is required"