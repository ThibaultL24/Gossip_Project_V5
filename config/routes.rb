Rails.application.routes.draw do
  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'
  get '/team', to: 'static_pages#team', as: 'team'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  resources :gossips 
  resources :tags, only: [:index]
  resources :cities, only: [:index, :show]

  resources :users, only: [:show, :index] do
    resources :gossips, controller: 'gossips'
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root 'static_pages#home'
end
