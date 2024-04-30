Rails.application.routes.draw do
  
  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  get '/team', to: 'static_pages#team', as: 'team'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  resources :tags, only: [:index]

  resources :users, only: [:show, :index] do
    resources :gossips, only: [:index], controller: 'users'
  end

  # Vous avez déjà défini la route pour l'index des gossips ci-dessus, donc cette ligne est redondante.
  # get '/gossips', to: 'gossips#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/gossips', to: 'gossips#index'

  # Définit la route racine ("/")
  root 'static_pages#home'
end