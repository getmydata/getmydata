Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users

  get '/profile', to: "users#profile", as: :profile
end
