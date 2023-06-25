# README

Este é um pequeno projeto para um software MVC escrito em Ruby on Rails versão 7.0, que utiliza Ruby 3.2, banco de dados PostgreSQL e algumas gems, como RubyXL, Ransack, Kaminari e Bootstrap para layout.

## Requisitos
Certifique-se de ter as seguintes dependências instaladas antes de prosseguir:

* Ruby 3.2
* Ruby on Rails 7.0
* PostgreSQL
* Yarn ou NPM

## Instalação
Clone o repositório e instale as dependências:

```bash
bundle install
```

Crie o banco de dados e execute as migrações:

```bash
rails db:create
rails db:migrate
```

Execute o arquivo `db/seeds.rb` para popular o banco de dados com dados de teste:

```bash
rails db:seed
```

Inicie o servidor:

```bash
rails server
```

compile os assets:

```bash
yarn
```

```bash
yarn watch:css
```

## Utilização

Acesse o sistema em `http://localhost:3000/`

## Gems utilizadas

Este software faz uso das seguintes gems para fornecer funcionalidades adicionais:

* RubyXL: Uma biblioteca para manipulação de arquivos Excel em Ruby. Permite importar e exportar dados para planilhas Excel.
* Ransack: Uma biblioteca para construção de consultas avançadas em Ruby on Rails. Facilita a criação de pesquisas complexas em modelos.
* Kaminari: Uma gem de paginação para Ruby on Rails. Facilita a criação de páginas com suporte a navegação paginada.
* Bootstrap: Um framework front-end popular para criação de layouts responsivos. Facilita o desenvolvimento de interfaces atraentes e amigáveis.
