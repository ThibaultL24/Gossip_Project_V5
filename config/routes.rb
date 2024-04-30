Rails.application.routes.draw do
  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  get '/team', to: 'static_pages#team', as: 'team'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/gossips/new', to: 'gossips#new', as: 'new_gossip'
  post '/gossips', to: 'gossips#create'

  resources :tags, only: [:index]

  resources :users, only: [:show, :index] do
    resources :gossips, only: [:index, :new, :create], controller: 'gossips'
    get 'profile', on: :member # Crée une route /users/:id/profile
  end

  resources :gossips, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  root 'static_pages#home'
end
