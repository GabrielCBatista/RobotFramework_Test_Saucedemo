*** Settings ***
Documentation       Este arquivo contém os casos de teste automatizados
...                 para a execução correta do teste, é necessário ter as bibliotecas atualizadas do pip:
...                 robotframework, seleniumlibrary e requests. Além disso, o chromedriver deve estar dentro
...                 de um arquivo que esteja adicionado ao caminho dentro das variáveis de ambiente (Path) e
...                 deve ser a mesma versão do navegador padrão.
...                 Certifique-se de ter seguido esses pré-requisitos antes de executar o teste.

Resource           ..\\resources\\finalizar_pedido_resource.robot
Suite Setup        Abrir Navegador finalizar
Test Setup         Inicio do Teste finalizar
Test Teardown      Fim do Teste finalizar
Suite Teardown     Fechar Navegador finalizar

*** Test Cases ***
Cenário 1: Validar preços dos produtos
    [Documentation]     Como usuário, quero verificar se o campo nome aceita somente uma palavra
    [Tags]              name-validation
    Dado que estou na tela do pedido "Checkout: Overview" com dois itens selecionados
    Então devo ver o nome e o preço de cada produto no resumo e o subtotal, imposto e total do pedido

Cenário 3: Remover um produto do carrinho
    [Documentation]     Como usuário, quero remover um produto que não desejo mais comprar do meu carrinho.
    [Tags]              carrinho, remover, produto
    Dado que estou na tela do pedido "Checkout: Overview" com dois itens selecionados
    Quando confirmo o pedido de compra
    Então devo ver a mensagem "Thank you for your order!" na tela
