Rails.application.routes.draw do
  resources :articles

  # Define the root route of the application
  root "pages#home"

  # Rails health check
  get "up" => "rails/health#show", as: :rails_health_check

  get "signup", to: "users#new"
  resources :users, except: [:new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
