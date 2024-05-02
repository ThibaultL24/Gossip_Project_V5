Rails.application.routes.draw do
  resources :likes, only: [:index, :create, :destroy]

  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  get '/team', to: 'static_pages#team', as: 'team'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  resources :gossips do
    resources :comments
    member do
      post 'like', to: 'gossips#like', as: 'like_post'
      delete 'unlike', to: 'gossips#unlike', as: 'unlike'
    end
  end

  resources :tags, only: [:index]
  resources :cities, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :gossips, controller: 'gossips'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root 'static_pages#home'
end
