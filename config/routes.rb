Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :companies do
    resources :messages
  end

  resources :users do
    resources :messages, only: [:index, :show]
  end

  resources :reviews
  get '/profile', to: "users#profile", as: :profile
  get '/show', to: "users#show", as: :show
end
