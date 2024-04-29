Rails.application.routes.draw do

  resources :users, only: [:index]

  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  # Route pour la page de l'équipe
  get '/team', to: 'static_pages#team'

  # Route pour la page de contact
  get '/contact', to: 'static_pages#contact'

  get '/gossips/:id', to: 'gossips#show', as: 'gossip'

  get '/users/:user_id/gossips', to: 'users#gossips', as: 'user_gossips'

  get '/tags', to: 'tags#index', as: 'tags'

  get '/gossips', to: 'gossips#index', as: 'gossips'

  get '/users', to: 'users#index', as: 'users'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'static_pages#home'
end