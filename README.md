# Rails Blog Application

Uma aplicação de blog completa desenvolvida em Ruby on Rails 8.0, com sistema de autenticação, gerenciamento de artigos, perfis de usuários e funcionalidades de administrador.

Este projeto é uma aplicação web moderna que permite aos usuários criar, editar e gerenciar artigos de blog. A aplicação implementa um sistema completo de autenticação e autorização, onde cada usuário pode criar seus próprios artigos e gerenciar seu perfil. Administradores têm permissões especiais para moderar conteúdo e gerenciar usuários.

A aplicação foi desenvolvida seguindo as melhores práticas do Rails, utilizando convenções do framework, validações robustas, associações entre modelos e uma interface responsiva com Bootstrap 5. O projeto demonstra conceitos fundamentais de desenvolvimento web, incluindo CRUD completo, paginação, sessões de usuário, e proteção de rotas.

## 📋 Índice

- [Funcionalidades](#-funcionalidades)
- [Tecnologias](#-tecnologias)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Banco de Dados](#-banco-de-dados)
- [Executando a Aplicação](#-executando-a-aplicação)
- [Testes](#-testes)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Rotas](#-rotas)
- [Deploy](#-deploy)

## 🚀 Funcionalidades

### Autenticação e Autorização
- ✅ Sistema de login/logout
- ✅ Registro de novos usuários
- ✅ Autenticação com `has_secure_password` (bcrypt)
- ✅ Sessões de usuário
- ✅ Proteção de rotas (require_user, require_same_user)
- ✅ Sistema de administrador com permissões especiais

### Gerenciamento de Artigos
- ✅ CRUD completo de artigos
- ✅ Paginação com will_paginate
- ✅ Validações de título e descrição
- ✅ Associação com usuários (cada artigo pertence a um usuário)
- ✅ Usuários só podem editar/deletar seus próprios artigos
- ✅ Admins podem editar/deletar qualquer artigo

### Gerenciamento de Usuários
- ✅ Perfis de usuário com avatar (Gravatar)
- ✅ Listagem paginada de usuários
- ✅ Edição de perfil
- ✅ Exclusão de conta (com cascade de artigos)
- ✅ Admins podem deletar qualquer usuário
- ✅ Contador de artigos por usuário

### Interface
- ✅ Design responsivo com Bootstrap 5
- ✅ Navegação dinâmica baseada em autenticação
- ✅ Mensagens flash (sucesso/erro) com estilos diferentes
- ✅ Paginação estilizada
- ✅ Dropdown de perfil com ações rápidas

## 🛠️ Tecnologias

- **Ruby** 3.2.10
- **Ruby on Rails** 8.0.1
- **SQLite3** (banco de dados)
- **Bootstrap** 5.3 (UI framework)
- **Turbo Rails** (SPA-like navigation)
- **Stimulus** (JavaScript framework)
- **will_paginate** (paginação)
- **bcrypt** (criptografia de senhas)
- **Docker** e **Docker Compose** (containerização)
- **DartSass** (compilação de CSS)

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Docker** (versão 20.10 ou superior)
- **Docker Compose** (versão 2.0 ou superior)
- **Git** (para clonar o repositório)

### Verificando as instalações

```bash
docker --version
docker compose version
git --version
```

## 🔧 Instalação

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

## ⚙️ Configuração

### Variáveis de Ambiente

A aplicação usa configurações padrão do Rails. Para produção, você pode configurar variáveis de ambiente no arquivo `config/environments/production.rb` ou através de variáveis de ambiente do Docker.

### Configuração do Banco de Dados

O banco de dados está configurado para usar SQLite3 por padrão. As configurações estão em `config/database.yml`.

Para desenvolvimento:
- Database: `storage/development.sqlite3`

Para produção, considere usar PostgreSQL ou MySQL.

### Configuração de Assets

A aplicação usa DartSass para compilação de CSS. O CSS é compilado automaticamente quando o servidor inicia.

Para recompilar manualmente:

```bash
docker compose exec web rails dartsass:build
```

## 🗄️ Banco de Dados

### Criação do Banco de Dados

O banco de dados é criado automaticamente quando você executa as migrações:

```bash
docker compose exec web rails db:migrate
```

### Inicialização do Banco de Dados

Para popular o banco com dados iniciais:

```bash
docker compose exec web rails db:seed
```

### Reset do Banco de Dados

Para resetar completamente o banco de dados (cuidado: isso apaga todos os dados):

```bash
docker compose exec web rails db:reset
```

Ou manualmente:

```bash
docker compose exec web rails db:drop
docker compose exec web rails db:create
docker compose exec web rails db:migrate
docker compose exec web rails db:seed
```

### Limpar Dados

Para limpar todos os usuários e artigos:

```bash
docker compose exec web rails runner "
Article.destroy_all
User.destroy_all
ActiveRecord::Base.connection.execute(\"DELETE FROM sqlite_sequence WHERE name IN ('users', 'articles')\")
"
```

## 🚀 Executando a Aplicação

### Modo Desenvolvimento

```bash
docker compose up
```

A aplicação estará disponível em `http://localhost:3000`

### Parar a Aplicação

```bash
docker compose down
```

### Rebuild dos Containers

Se houver mudanças no Dockerfile ou dependências:

```bash
docker compose down
docker compose up --build
```

### Console Rails

Para acessar o console Rails:

```bash
docker compose exec web rails console
```

### Logs

Para ver os logs da aplicação:

```bash
docker compose logs web
```

Para seguir os logs em tempo real:

```bash
docker compose logs -f web
```

## 👤 Usuário Admin Padrão

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

**Credenciais padrão:**
- Email: `admin@example.com`
- Senha: `password123`

## 🧪 Testes

### Executando os Testes

Para executar toda a suíte de testes:

```bash
docker compose exec web rails test
```

### Testes Específicos

Para executar testes de um arquivo específico:

```bash
docker compose exec web rails test test/models/article_test.rb
```

### Testes de Sistema

Para executar testes de sistema (end-to-end):

```bash
docker compose exec web rails test:system
```

### Cobertura de Testes

A aplicação inclui testes básicos para modelos e controllers. Para uma cobertura mais completa, considere adicionar testes de integração e system tests.

## 📁 Estrutura do Projeto

```
rails-blog-app/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb    # Helpers de autenticação
│   │   ├── articles_controller.rb       # CRUD de artigos
│   │   ├── users_controller.rb          # Gerenciamento de usuários
│   │   ├── sessions_controller.rb       # Login/logout
│   │   └── pages_controller.rb          # Página inicial
│   ├── models/
│   │   ├── user.rb                      # Modelo de usuário
│   │   └── article.rb                   # Modelo de artigo
│   ├── views/
│   │   ├── articles/                    # Views de artigos
│   │   ├── users/                       # Views de usuários
│   │   ├── sessions/                    # Views de login
│   │   └── layouts/                     # Layouts e partials
│   ├── helpers/
│   │   └── application_helper.rb        # Helper do Gravatar
│   ├── assets/
│   │   ├── stylesheets/                 # Arquivos SCSS/CSS
│   │   └── javascript/                  # Arquivos JavaScript
│   └── jobs/                            # Background jobs
├── config/
│   ├── application.rb                   # Configuração principal
│   ├── routes.rb                        # Rotas da aplicação
│   ├── database.yml                     # Configuração do banco
│   └── environments/                    # Configurações por ambiente
├── db/
│   ├── migrate/                         # Migrações
│   ├── schema.rb                        # Schema do banco
│   └── seeds.rb                         # Dados iniciais
├── test/                                # Testes
├── public/                              # Arquivos estáticos
├── docker-compose.yaml                  # Configuração Docker
├── Dockerfile                           # Dockerfile para produção
├── Dockerfile.dev                       # Dockerfile para desenvolvimento
└── Gemfile                              # Dependências Ruby
```

## 🗂️ Rotas Principais

- `/` - Página inicial (redireciona para artigos se logado)
- `/articles` - Lista de artigos
- `/articles/new` - Criar novo artigo (requer login)
- `/articles/:id` - Visualizar artigo
- `/articles/:id/edit` - Editar artigo (requer ser dono ou admin)
- `/users` - Lista de usuários
- `/users/:id` - Perfil do usuário
- `/signup` - Registro de novo usuário
- `/login` - Login
- `/logout` - Logout (DELETE)

## 👥 Permissões

### Usuário Normal
- Criar, editar e deletar seus próprios artigos
- Editar seu próprio perfil
- Visualizar todos os artigos e usuários

### Administrador
- Todas as permissões de usuário normal
- Editar/deletar qualquer artigo
- Deletar qualquer usuário
- Acesso a funcionalidades administrativas

## 🔐 Segurança

- ✅ Senhas criptografadas com bcrypt
- ✅ Proteção CSRF
- ✅ Validação de parâmetros (strong parameters)
- ✅ Verificação de propriedade antes de editar/deletar
- ✅ Proteção de rotas com before_action
- ✅ Sessões seguras

## 🎨 Recursos de UI/UX

- Design responsivo com Bootstrap 5
- Navegação adaptativa (mostra login/logout baseado em autenticação)
- Mensagens flash coloridas (verde para sucesso, vermelho para erro)
- Paginação estilizada
- Avatares via Gravatar
- Confirmações antes de deletar

## 🚀 Deploy

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

### Serviços e Jobs

A aplicação usa:
- **Solid Queue**: Para processamento de jobs em background
- **Solid Cache**: Para cache de dados
- **Solid Cable**: Para Action Cable (WebSockets)

## 🐛 Troubleshooting

### Erro ao iniciar Docker

```bash
docker compose down
docker compose up --build
```

### Problemas com migrações

```bash
docker compose exec web rails db:reset
docker compose exec web rails db:migrate
```

### Limpar cache

```bash
docker compose exec web rails tmp:clear
```

### Problemas com permissões

Se houver problemas de permissão com arquivos:

```bash
docker compose exec web chmod -R 755 .
```

### Container não inicia

Verifique os logs:

```bash
docker compose logs web
```

## 🎯 Objetivos do Projeto

Este projeto foi desenvolvido como uma aplicação prática para demonstrar e aprender:

- **Fundamentos do Rails**: Convenções, MVC, helpers, partials
- **Autenticação e Autorização**: Sistema completo de login, sessões e permissões
- **Associações de Modelos**: Relacionamentos entre User e Article
- **Validações**: Garantir integridade dos dados
- **Interface Moderna**: Design responsivo com Bootstrap e Turbo
- **Boas Práticas**: Código limpo, DRY, segurança e organização

## 📚 Conceitos Aprendidos

Durante o desenvolvimento deste projeto, foram explorados:

- **ActiveRecord**: ORM do Rails, migrations, associações (`has_many`, `belongs_to`), callbacks
- **ActionController**: Controllers, before_actions, strong parameters, flash messages
- **ActionView**: ERB templates, partials, helpers, layouts
- **Routing**: RESTful routes, nested resources, custom routes
- **Security**: CSRF protection, password encryption (bcrypt), session management
- **Frontend**: Bootstrap 5, Turbo Rails, Stimulus, responsive design
- **Docker**: Containerização para desenvolvimento consistente

## 🔄 Fluxo da Aplicação

1. **Usuários não autenticados** podem visualizar artigos e perfis, mas precisam fazer login para criar conteúdo
2. **Usuários autenticados** podem criar, editar e deletar seus próprios artigos, além de gerenciar seu perfil
3. **Administradores** têm permissões ampliadas para moderar qualquer conteúdo e gerenciar usuários
4. **Sistema de paginação** melhora a navegação quando há muitos artigos ou usuários
5. **Mensagens flash** fornecem feedback claro sobre ações realizadas

## 🚧 Melhorias Futuras

Algumas funcionalidades que podem ser adicionadas:

- Sistema de comentários nos artigos
- Upload de imagens para artigos e perfis
- Busca e filtros avançados
- Tags e categorias para artigos
- Sistema de likes/favoritos
- Notificações em tempo real
- API RESTful completa
- Testes automatizados mais abrangentes

## 📝 Comandos Úteis

### Console Rails
```bash
docker compose exec web rails console
```

### Gerar Migration
```bash
docker compose exec web rails generate migration NomeDaMigration
```

### Gerar Model
```bash
docker compose exec web rails generate model NomeDoModel
```

### Gerar Controller
```bash
docker compose exec web rails generate controller NomeDoController
```

### Rollback de Migration
```bash
docker compose exec web rails db:rollback
```

### Ver Rotas
```bash
docker compose exec web rails routes
```

---

**Versão:** 1.0.0  
**Última atualização:** Janeiro 2026
