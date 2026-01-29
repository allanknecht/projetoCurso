# This file should ensure all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.create!(
  title: "Introduction to Ruby on Rails",
  description: "Learn the basic concepts of Ruby on Rails, a powerful web framework for building Ruby applications."
)

Article.create!(
  title: "Creating a CRUD System in Rails",
  description: "In this article, you will learn how to create a simple CRUD system using Ruby on Rails, with basic operations to create, read, update, and delete data."
)

Article.create!(
  title: "Best Practices in Ruby on Rails",
  description: "Explore best practices for development in Ruby on Rails, including conventions, code structure, and performance optimization."
)

Article.create!(
  title: "Authentication and Authorization in Rails with Devise",
  description: "Discover how to set up authentication and authorization in a Rails application using the Devise gem for login and permission control."
)

Article.create!(
  title: "Testing Rails Applications with RSpec",
  description: "Learn how to write unit and integration tests using RSpec in your Ruby on Rails applications to ensure code quality."
)

Article.create!(
  title: "Database Integration in Rails",
  description: "Understand how Ruby on Rails interacts with databases, including relational database configuration, migrations, and model associations."
)

Article.create!(
  title: "Building RESTful APIs with Rails",
  description: "In this article, we cover how to build a RESTful API using Ruby on Rails, with token authentication and JSON data consumption."
)

Article.create!(
  title: "Real-time Communication with WebSockets in Rails",
  description: "Learn how to use WebSockets for real-time communication in your Rails applications, creating interactive and dynamic experiences."
)

Article.create!(
  title: "Deploying Rails Applications with Heroku",
  description: "Discover the process of deploying a Rails application to Heroku, configuring the environment and dependencies correctly."
)

Article.create!(
  title: "Improving Rails Application Performance",
  description: "Explore techniques and tools to improve the performance of your Ruby on Rails applications, from query optimization to caching."
)
