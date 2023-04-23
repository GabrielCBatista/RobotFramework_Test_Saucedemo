# Atividade 1

## Teste do site Saucedemo

Este projeto consiste em testes automatizados utilizando o framework Robot Framework e a biblioteca SeleniumLibrary para realizar testes no site Saucedemo.

### Pré-requisitos

- É necessário ter o `chromedriver` na mesma versão do Google Chrome instalado e configurar o caminho para o diretório do `chromedriver` nas variáveis de ambiente do sistema operacional.

### Instalação

Para instalar as `dependências do projeto`, execute o seguinte comando:

```bash
pip install -U pip robotframework robotframework-seleniumlibrary robotframework-requests
bash
```
### Execução dos testes

Para executar os testes, execute o seguinte comando:
```bash
robot -d resultados test_saucedemo/tests
```

Os testes estão no formato BDD (Behavior-Driven Development) e no formato `Test Setup, Test Teardown` no caminho test_saucedemo/tests e são os seguintes:

```bash
login_saucedemo_teste.robot
produto_saucedemo_teste.robot
compra_saucedemo_teste.robot
```
#
# Atividade 2


## Plano de Teste - Cadastro de Agroespecialista na Plataforma Orbia

### Introdução:
Este plano de teste tem como objetivo validar o cadastro de um Agroespecialista na plataforma Orbia. Serão testados os comportamentos esperados e as regras de negócio, além de verificar os comportamentos de exceção.

### Requisitos de teste:

Ter um usuário cadastrado na plataforma Orbia.
O usuário deve estar logado na plataforma para realizar o pré-cadastro.
O usuário deve estar cadastrado com ao menos um endereço.

### Comportamentos esperados:

Ao clicar em "Quero começar" ou "Quero fazer parte!", o usuário deve ser direcionado para a página de confirmação de dados para o cadastro como Agroespecialista.
Ao informar o perfil de atuação como Pessoa Física ou Pessoa Jurídica, o campo deve ser obrigatório.
No caso de atuação como Pessoa Jurídica, a lista de empresas deve ser exibida em ordem alfabética e o campo deve ser obrigatório.
Caso o usuário não tenha uma empresa cadastrada, ele deve ser direcionado para a página de cadastro de empresa, que é praticamente a mesma página em Dados Cadastrais > Minhas empresas > Adicionar Empresa.
Ao informar os números dos registros e UF, o usuário deve digitar apenas números no campo do "Número de registros" e a UF deve ser listada em ordem alfabética.
Ao adicionar outro CREA, CFTA ou CRMV, o usuário deve ter a opção de deletar o registro adicionado, além de ser obrigatório preencher todos os dados do registro.
O usuário só poderá prosseguir com o cadastro após dar aceite no checkbox do termo, que deve ser obrigatório.
Ao clicar no link do checkbox do termo, deve ser exibida uma página extra com o documento em pdf do termo.
Após o pré-cadastro, o usuário deve ser direcionado para uma tela com mensagem de análise dos dados enviados.

### Regras de negócio:

Adicionar um novo campo de Tipo de documento com as opções CREA, CFTA e CRMV. O campo deve ser do tipo combo e obrigatório.
No caso do CFTA, por ser federal, o campo UF deve ser omitido.
Listar Empresas em ordem alfabética.
No campo do "Número de registros" somente números são permitidos.
Não deve permitir seguir com o cadastro se alguma linha de número de conselho possuir um campo não preenchido.
Não deve permitir adicionar linha com dados repetidos.
Não permitir adicionar mais de um número do mesmo conselho para o mesmo estado.

### Comportamentos de exceção:

Permitir adicionar um novo "Número de registro" se tiver pelo menos uma linha preenchida com todos os dados do registro do documento.
Não deve permitir seguir com o cadastro se alguma linha de número de conselho possuir um campo não preenchido.
Não deve permitir adicionar linha com dados repetidos.
Não permitir adicionar mais de um número do mesmo conselho para o mesmo estado.


### Teste de pré-requisitos:

a. Verificar se o usuário já possui uma conta na plataforma Orbia.
b. Verificar se o usuário já possui ao menos um endereço cadastrado.
c. Verificar se o usuário está logado na plataforma.

### Teste de comportamento esperado:

a. Verificar se, ao clicar em “Quero começar” ou “Quero fazer parte!”, o usuário é direcionado para a página de cadastro de agroespecialista.
b. Verificar se a página de cadastro de agroespecialista solicita os dados obrigatórios para o cadastro.
c. Verificar se o campo "Com qual perfil você gostaria de atuar" é obrigatório e apresenta as opções "Pessoa Física" ou "Pessoa Jurídica".
d. Verificar se, no caso de "Atuar como empresa", as empresas são listadas em ordem alfabética, sendo a empresa favorita a primeira da lista.
e. Verificar se é possível adicionar uma nova empresa.
f. Verificar se, ao selecionar "Adicionar uma empresa", o usuário é direcionado para a página de cadastro de empresa, que é similar à página de cadastro de agroespecialista.
g. Verificar se o campo "Informa os números dos registros e UF" solicita os números do CREA, CFTA ou CRMV, sendo a UF listada em ordem alfabética.
h. Verificar se é possível adicionar outro registro do mesmo tipo e estado do conselho.
i. Verificar se é possível excluir um registro.
j. Verificar se o usuário só pode prosseguir após aceitar o checkbox do termo.
k. Verificar se ao clicar no link do termo, é exibida uma página extra com o documento em pdf do termo.
l. Verificar se após o pré-cadastro, o usuário é direcionado para a tela com a mensagem de análise dos dados enviados.

### Teste de regras:
a. Verificar se o campo "Tipo de documento" é um combo obrigatório, com as opções CREA, CFTA e CRMV.
b. Verificar se, no caso do CFTA, o campo UF é omitido.
c. Verificar se as empresas são listadas em ordem alfabética.
d. Verificar se o campo "Número de registros" só aceita números.

### Teste de comportamentos de exceção:
a. Verificar se é possível adicionar um novo "Número de registro" se tiver pelo menos uma linha preenchida com todos os dados do registro do documento.
b. Verificar se não é possível seguir com o cadastro se alguma linha de número de conselho possuir um campo não preenchido.
c. Verificar se não é possível adicionar uma linha com dados repetidos.
d. Verificar se não é possível adicionar mais de um número do mesmo conselho para o mesmo estado.

### Pontos de melhoria:

Melhorar a clareza das informações apresentadas na página de cadastro, para que os usuários possam entender facilmente quais são as informações obrigatórias e opcionais.

Incluir validações de dados mais abrangentes para garantir que as informações inseridas pelos usuários sejam precisas e corretas, como validações de formato de CPF, CNPJ e números de conselhos.

Adicionar uma funcionalidade de verificação de e-mail para garantir que os usuários estejam fornecendo um endereço de e-mail válido e acessível.

Incluir uma opção para permitir que os usuários carreguem documentos comprovativos relevantes, como certificados de registro de conselho ou documentos de identificação, para facilitar a validação de suas informações.

Simplificar a interface de usuário para tornar o processo de cadastro mais intuitivo e fácil de seguir.

Adicionar uma funcionalidade de confirmação por SMS ou por telefone para garantir que as informações de contato fornecidas pelos usuários sejam válidas.

Incluir um recurso de suporte ao usuário em tempo real, como chat ao vivo ou suporte por telefone, para ajudar os usuários durante o processo de cadastro.

Realizar testes de usabilidade e coletar feedback dos usuários para identificar quaisquer problemas ou dificuldades encontrados durante o processo de cadastro e trabalhar para corrigi-los.

Revisar a política de privacidade e segurança da plataforma para garantir que as informações dos usuários sejam protegidas adequadamente.

Criar tutoriais ou guias de usuário detalhados para ajudar os usuários a entender melhor como usar a plataforma e completar o processo de cadastro com sucesso.