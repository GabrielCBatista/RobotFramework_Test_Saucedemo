*** Settings ***
Documentation       Este arquivo contém os casos de teste automatizados
...                 para a execução correta do teste, é necessário ter as bibliotecas atualizadas do pip: 
...                 robotframework, seleniumlibrary e requests. Além disso, o chromedriver deve estar dentro
...                 de um arquivo que esteja adicionado ao caminho dentro das variáveis de ambiente (Path) e
...                 deve ser a mesma versão do navegador padrão.
...                 Certifique-se de ter seguido esses pré-requisitos antes de executar o teste.

Resource          ..\\resources\\login_saucedemo_resource.robot
Suite Setup        Abrir Navegador login
Test Setup         Inicio do Teste login
Test Teardown      Fim do Teste login
Suite Teardown     Fechar Navegador login


*** Test Cases ***
Cenario 1 - Tentativa de Login sem Usuário
    [Documentation]         Como um usuário do site de compras Swag Labs, 
    ...                     desejo que o sistema valide a necessidade de preencher o campo de usuário
    ...                     no momento do login para garantir a segurança dos meus dados.
    [Tags]                  Login, Segurança

    Dado que eu estou na página de login que contém o título "Swag Labs"
    Quando eu tento fazer login sem preencher o campo usuário
    Então devo ver uma mensagem de erro informando que o usuário é necessário

Cenario 2 - Tentativa de Login sem Senha
    [Documentation]         Como um usuário do site de compras Swag Labs,
    ...                     desejo que o sistema valide a necessidade de preencher o campo de senha
    ...                     no momento do login para garantir a segurança dos meus dados.
    [Tags]    Login, Segurança

    Dado que eu estou na página de login que contém o título "Swag Labs"
    Quando eu tento fazer login sem preencher o campo senha
    Então devo ver uma mensagem de erro informando que a senha é necessária

Cenario 3 - Tentativa de Login com Usuário e Senha Inválidos
    [Documentation]        Como um usuário do site de compras Swag Labs,
    ...                    desejo que o sistema valide as credenciais de login inseridas
    ...                    para que eu seja informado se elas estão incorretas.
    [Tags]     Login, Validação

    Dado que eu estou na página de login que contém o título "Swag Labs"
    Quando eu tento fazer login com um usuário e senha inválidos
    Então devo ver uma mensagem de erro informando que o usuário e/ou senha estão incorretos

Cenario 4 - Login com Sucesso
    [Documentation]         Como um usuário do site de compras Swag Labs, 
    ...                     desejo que o sistema faça o login com sucesso para que eu possa acessar
    ...                     a página principal e visualizar os produtos disponíveis para compra.

    [Tags]    Login, Acesso
    Dado que eu estou na página de login que contém o título "Swag Labs"
    Quando eu faço login com um usuário e senha válidos
    Então devo ver a página principal dos produtos que contém o título "Products"