# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.create!(
  title: "Introdução ao Ruby on Rails",
  description: "Aprenda os conceitos básicos de Ruby on Rails, uma poderosa framework web para construir aplicações em Ruby."
)

Article.create!(
  title: "Como Criar um CRUD no Rails",
  description: "Neste artigo, você aprenderá a criar um sistema CRUD simples utilizando Ruby on Rails, com operações básicas de criar, ler, atualizar e excluir dados."
)

Article.create!(
  title: "Melhores Práticas em Ruby on Rails",
  description: "Explore as melhores práticas de desenvolvimento em Ruby on Rails, incluindo convenções, estrutura de código e otimização de desempenho."
)

Article.create!(
  title: "Autenticação e Autorização no Rails com Devise",
  description: "Descubra como configurar autenticação e autorização em uma aplicação Rails usando a gem Devise para login e controle de permissões."
)

Article.create!(
  title: "Testando Aplicações Rails com RSpec",
  description: "Aprenda a escrever testes unitários e de integração utilizando RSpec em suas aplicações Ruby on Rails para garantir a qualidade do código."
)

Article.create!(
  title: "Trabalhando com Banco de Dados no Rails",
  description: "Entenda como o Ruby on Rails interage com bancos de dados, incluindo a configuração de bancos relacionais, migrations e associações de modelos."
)

Article.create!(
  title: "Criando APIs com Ruby on Rails",
  description: "Neste artigo, abordamos como construir uma API RESTful utilizando Ruby on Rails, com autenticação via token e consumo de dados em JSON."
)

Article.create!(
  title: "Como Usar WebSockets com Rails",
  description: "Aprenda a utilizar WebSockets para comunicação em tempo real em suas aplicações Rails, criando experiências interativas e dinâmicas."
)

Article.create!(
  title: "Deploy de Aplicações Rails com Heroku",
  description: "Descubra o processo de deploy de uma aplicação Rails para o Heroku, configurando o ambiente e as dependências corretamente."
)

Article.create!(
  title: "Melhorando o Desempenho de Aplicações Rails",
  description: "Explore técnicas e ferramentas para melhorar o desempenho de suas aplicações Ruby on Rails, desde otimização de queries até caching."
)