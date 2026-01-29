# Rails Blog App

A complete blog application developed with Ruby on Rails 8.0, featuring authentication system, article management, user profiles, and administrator functionality.

## Ruby version

- **Ruby** 3.2.10
- **Ruby on Rails** 8.0.1

## System dependencies

- **Docker** (version 20.10 or higher)
- **Docker Compose** (version 2.0 or higher)
- **Git** (to clone the repository)

### Checking installations

```bash
docker --version
docker compose version
git --version
```

## Configuration

### Environment Variables

The application uses default Rails configurations. For production, you can configure environment variables in the `config/environments/production.rb` file or through Docker environment variables.

### Database Configuration

The database is configured to use SQLite3 by default. Settings are in `config/database.yml`.

- **Development**: `storage/development.sqlite3`
- **Test**: `storage/test.sqlite3`
- **Production**: Consider using PostgreSQL or MySQL

### Assets Configuration

The application uses DartSass for CSS compilation. CSS is compiled automatically when the server starts.

To install DartSass:

```bash
docker compose exec web rails dartsass:install
```

To manually recompile:

```bash
docker compose exec web rails dartsass:build
```

## Database creation

The database is created automatically when you run migrations:

```bash
docker compose exec web rails db:migrate
```

## Database initialization

To populate the database with initial data:

```bash
docker compose exec web rails db:seed
```

## How to run the test suite

To run the entire test suite:

```bash
docker compose exec web rails test
```

To run tests from a specific file:

```bash
docker compose exec web rails test test/models/article_test.rb
```

To run system tests (end-to-end):

```bash
docker compose exec web rails test:system
```

## Services (job queues, cache servers, search engines, etc.)

The application uses the following services:

- **Solid Queue**: For background job processing
- **Solid Cache**: For data caching
- **Solid Cable**: For Action Cable (WebSockets)

### Managing Services

Services are started automatically with the application through Docker Compose.

## Deployment instructions

### Setup with Docker Compose

To set up the application:

```bash
docker compose up
```

### Migrations

Run database migrations:

```bash
docker compose exec web rails db:migrate
```

Or access the container and run:

```bash
docker compose exec web bash
rake db:migrate
```

### Seeds

To populate the database with initial data:

```bash
docker compose exec web rails db:seed
```

Or inside the container:

```bash
docker compose exec web bash
rake db:seed
```

### Deploy with Kamal

The application is configured for deployment with Kamal. To deploy:

```bash
kamal setup
kamal deploy
```

### Manual Deploy

1. Configure production environment variables
2. Run migrations: `rails db:migrate RAILS_ENV=production`
3. Compile assets: `rails assets:precompile`
4. Start the server: `rails server -e production`

## Complete Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd rails-blog-app
```

### 2. Start Docker containers

```bash
docker compose up
```

Or to run in background:

```bash
docker compose up -d
```

### 3. Run migrations

In a new terminal:

```bash
docker compose exec web rails db:migrate
```

### 4. (Optional) Load sample data

```bash
docker compose exec web rails db:seed
```

### 5. Access the application

Open your browser at: `http://localhost:3000`

## Creating an Admin User

After installation, you can create an admin user through the Rails console:

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

## Technologies Used

- **Ruby on Rails** 8.0.1
- **SQLite3** (database)
- **Bootstrap** 5.3 (UI framework)
- **Turbo Rails** (SPA-like navigation)
- **Stimulus** (JavaScript framework)
- **will_paginate** (pagination)
- **bcrypt** (password encryption)
- **Docker** and **Docker Compose** (containerization)
- **DartSass** (CSS compilation)

## Main Features

- ✅ Complete authentication and authorization system
- ✅ Full CRUD for articles
- ✅ User and profile management
- ✅ Administrator system with special permissions
- ✅ Pagination with will_paginate
- ✅ Responsive design with Bootstrap 5
- ✅ Flash messages (success/error)

## Useful Commands

### Rails Console
```bash
docker compose exec web rails console
```

### Logs
```bash
docker compose logs web
docker compose logs -f web  # follow logs in real-time
```

### Stop the application
```bash
docker compose down
```

### Rebuild containers
```bash
docker compose down
docker compose up --build
```

### Reset database
```bash
docker compose exec web rails db:reset
```

