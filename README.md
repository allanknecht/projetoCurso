# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Setup

### Docker Compose

Para realizar o setup da aplicação

    docker compose up

Migrações

    docker exec -it [container_id | container_name] bash

    rake db:migrate

Seeds

    rake db:seed

Rails css

    rails dartsass:install