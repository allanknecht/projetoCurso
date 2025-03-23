Rails.application.routes.draw do
  get "home/index"
  resources :articles

  # Define a rota raiz da aplicação
  root "home#index"

  # Health check do Rails
  get "up" => "rails/health#show", as: :rails_health_check

  get "signup", to: "users#new"
  resources :users, except: [:new]
end
