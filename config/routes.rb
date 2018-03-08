Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :companies do
    resources :messages
    resources :reviews, only: [ :index, :new, :create, :edit, :update]
  end

  resources :users do
    resources :messages, only: [:index, :show]
  end

  get '/profile', to: "users#profile", as: :profile
  get '/show', to: "users#show", as: :show
  get '/select', to: "companies#select", as: :select
end
