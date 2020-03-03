Workshop TreinaDev - Rebase
===========================

# Docker

## Criando projeto Rails com Docker

### Requisitos

 - Docker
 - Editor

### Criando arquivos iniciais

- Dockerfile

```
FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -

RUN apt-get update && \
      apt-get install -y vim nodejs
RUN npm install -g yarn

WORKDIR /workshop_treinadev
```

- docker-compose.yml

```
version: '3.0'

services:
  web:
    build: .
    volumes:
      - .:/workshop_treinadev
    links:
      - db
    env_file: .env
  db:
    image: postgres
    env_file: .env
```

- .env

```
DB_HOST=db
DB_USERNAME=postgres
```

### Criando a imagem inicial

```
docker-compose build
```

### Criando o projeto

Entre no container da aplicação

```
docker-compose run web bash
```

Crie o projeto

```
rails new . -T --database=postgresql
```

### Gem Adicionais

```
pry-byebug
capybara
rspec-rails
factory_bot_rails
devise
```

### Versão final do Dockerfile

- Dockerfile

```
FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -

RUN apt-get update && \
      apt-get install -y vim nodejs
RUN npm install -g yarn

WORKDIR /workshop_treinadev

ADD . /workshop_treinadev

RUN bundle install
```

Execute o `build` novamente

```
docker-compose build
```

### Execute os generators das gems adicionais

Dentro do container web execute:

```
rails g rspec:install
rails g devise:install
```

### Edite o `rails_helper.rb`

Adicione as linhas

```
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
```
