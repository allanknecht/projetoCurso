# Rails Blog App

Uma aplicação de blog completa desenvolvida em Ruby on Rails 8.0, com sistema de autenticação, gerenciamento de artigos, perfis de usuários e funcionalidades de administrador.

## Ruby version

- **Ruby** 3.2.10
- **Ruby on Rails** 8.0.1

## System dependencies

- **Docker** (versão 20.10 ou superior)
- **Docker Compose** (versão 2.0 ou superior)
- **Git** (para clonar o repositório)

### Verificando as instalações

```bash
docker --version
docker compose version
git --version
```

## Configuration

### Variáveis de Ambiente

A aplicação usa configurações padrão do Rails. Para produção, você pode configurar variáveis de ambiente no arquivo `config/environments/production.rb` ou através de variáveis de ambiente do Docker.

### Configuração do Banco de Dados

O banco de dados está configurado para usar SQLite3 por padrão. As configurações estão em `config/database.yml`.

- **Desenvolvimento**: `storage/development.sqlite3`
- **Teste**: `storage/test.sqlite3`
- **Produção**: Considere usar PostgreSQL ou MySQL

### Configuração de Assets

A aplicação usa DartSass para compilação de CSS. O CSS é compilado automaticamente quando o servidor inicia.

Para instalar o DartSass:

```bash
docker compose exec web rails dartsass:install
```

Para recompilar manualmente:

```bash
docker compose exec web rails dartsass:build
```

## Database creation

O banco de dados é criado automaticamente quando você executa as migrações:

```bash
docker compose exec web rails db:migrate
```

## Database initialization

Para popular o banco com dados iniciais:

```bash
docker compose exec web rails db:seed
```

## How to run the test suite

Para executar toda a suíte de testes:

```bash
docker compose exec web rails test
```

Para executar testes de um arquivo específico:

```bash
docker compose exec web rails test test/models/article_test.rb
```

Para executar testes de sistema (end-to-end):

```bash
docker compose exec web rails test:system
```

## Services (job queues, cache servers, search engines, etc.)

A aplicação usa os seguintes serviços:

- **Solid Queue**: Para processamento de jobs em background
- **Solid Cache**: Para cache de dados
- **Solid Cable**: Para Action Cable (WebSockets)

### Gerenciando os Serviços

Os serviços são iniciados automaticamente com a aplicação através do Docker Compose.

## Deployment instructions

### Setup com Docker Compose

Para realizar o setup da aplicação:

```bash
docker compose up
```

### Migrações

Execute as migrações do banco de dados:

```bash
docker compose exec web rails db:migrate
```

Ou acesse o container e execute:

```bash
docker compose exec web bash
rake db:migrate
```

### Seeds

Para popular o banco com dados iniciais:

```bash
docker compose exec web rails db:seed
```

Ou dentro do container:

```bash
docker compose exec web bash
rake db:seed
```

### Deploy com Kamal

A aplicação está configurada para deploy com Kamal. Para fazer deploy:

```bash
kamal setup
kamal deploy
```

### Deploy Manual

1. Configure as variáveis de ambiente de produção
2. Execute as migrações: `rails db:migrate RAILS_ENV=production`
3. Compile os assets: `rails assets:precompile`
4. Inicie o servidor: `rails server -e production`

## Setup Completo

### 1. Clone o repositório

```bash
git clone <url-do-repositorio>
cd rails-blog-app
```

### 2. Inicie os containers Docker

```bash
docker compose up
```

Ou para executar em background:

```bash
docker compose up -d
```

### 3. Execute as migrações

Em um novo terminal:

```bash
docker compose exec web rails db:migrate
```

### 4. (Opcional) Carregue dados de exemplo

```bash
docker compose exec web rails db:seed
```

### 5. Acesse a aplicação

Abra seu navegador em: `http://localhost:3000`

## Criando um Usuário Admin

Após a instalação, você pode criar um usuário admin através do console Rails:

```bash
docker compose exec web rails console
```

```ruby
User.create!(
  username: "admin",
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  admin: true
)
```

## Tecnologias Utilizadas

- **Ruby on Rails** 8.0.1
- **SQLite3** (banco de dados)
- **Bootstrap** 5.3 (UI framework)
- **Turbo Rails** (SPA-like navigation)
- **Stimulus** (JavaScript framework)
- **will_paginate** (paginação)
- **bcrypt** (criptografia de senhas)
- **Docker** e **Docker Compose** (containerização)
- **DartSass** (compilação de CSS)

## Funcionalidades Principais

- ✅ Sistema completo de autenticação e autorização
- ✅ CRUD completo de artigos
- ✅ Gerenciamento de usuários e perfis
- ✅ Sistema de administrador com permissões especiais
- ✅ Paginação com will_paginate
- ✅ Design responsivo com Bootstrap 5
- ✅ Mensagens flash (sucesso/erro)

## Comandos Úteis

### Console Rails
```bash
docker compose exec web rails console
```

### Logs
```bash
docker compose logs web
docker compose logs -f web  # seguir logs em tempo real
```

### Parar a aplicação
```bash
docker compose down
```

### Rebuild dos containers
```bash
docker compose down
docker compose up --build
```

### Reset do banco de dados
```bash
docker compose exec web rails db:reset
```

---

**Versão:** 1.0.0  
**Última atualização:** Janeiro 2026
