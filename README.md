# Projeto Curso - Blog Application

Uma aplicação de blog completa desenvolvida em Ruby on Rails 8.0, com sistema de autenticação, gerenciamento de artigos, perfis de usuários e funcionalidades de administrador.

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

- **Ruby on Rails** 8.0.1
- **Ruby** (versão do sistema)
- **SQLite3** (banco de dados)
- **Bootstrap** 5.3 (UI framework)
- **Turbo Rails** (SPA-like navigation)
- **Stimulus** (JavaScript framework)
- **will_paginate** (paginação)
- **bcrypt** (criptografia de senhas)
- **Docker** (containerização)

## 📋 Pré-requisitos

- Docker e Docker Compose instalados
- Git (para clonar o repositório)

## 🔧 Instalação

### 1. Clone o repositório

```bash
git clone <url-do-repositorio>
cd projetoCurso
```

### 2. Inicie os containers Docker

```bash
docker compose up
```

### 3. Execute as migrações

```bash
docker compose exec web rails db:migrate
```

### 4. (Opcional) Carregue dados de exemplo

```bash
docker compose exec web rails db:seed
```

### 5. Acesse a aplicação

Abra seu navegador em: `http://localhost:3000`

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

## 📁 Estrutura do Projeto

```
projetoCurso/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb    # Helpers de autenticação
│   │   ├── articles_controller.rb       # CRUD de artigos
│   │   ├── users_controller.rb          # Gerenciamento de usuários
│   │   ├── sessions_controller.rb       # Login/logout
│   │   └── pages_controller.rb          # Página inicial
│   ├── models/
│   │   ├── user.rb                      # Modelo de usuário
│   │   └── article.rb                    # Modelo de artigo
│   ├── views/
│   │   ├── articles/                    # Views de artigos
│   │   ├── users/                       # Views de usuários
│   │   ├── sessions/                    # Views de login
│   │   └── layouts/                    # Layouts e partials
│   └── helpers/
│       └── application_helper.rb        # Helper do Gravatar
├── config/
│   ├── routes.rb                        # Rotas da aplicação
│   └── database.yml                     # Configuração do banco
├── db/
│   ├── migrate/                         # Migrações
│   └── schema.rb                        # Schema do banco
└── docker-compose.yaml                  # Configuração Docker
```

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

## 🧪 Testes

Para executar os testes:

```bash
docker compose exec web rails test
```

## 📝 Comandos Úteis

### Console Rails
```bash
docker compose exec web rails console
```

### Logs
```bash
docker compose logs web
```

### Migrações
```bash
docker compose exec web rails db:migrate
docker compose exec web rails db:rollback
```

### Limpar banco de dados
```bash
docker compose exec web rails runner "
Article.destroy_all
User.destroy_all
ActiveRecord::Base.connection.execute(\"DELETE FROM sqlite_sequence WHERE name IN ('users', 'articles')\")
"
```

## 🗂️ Rotas Principais

- `/` - Página inicial (redireciona para artigos se logado)
- `/articles` - Lista de artigos
- `/articles/new` - Criar novo artigo (requer login)
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

## 📄 Licença

Este projeto foi desenvolvido como parte de um curso de Ruby on Rails.

## 👨‍💻 Autor

Desenvolvido durante o curso de Ruby on Rails.

---

**Versão:** 1.0.0  
**Última atualização:** Janeiro 2026
