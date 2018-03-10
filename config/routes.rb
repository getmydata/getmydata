Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :companies, except: :index do
    resources :messages
    resources :reviews
    member do
      put "like" => "companies#upvote"
      put "unlike" => "companies#downvote"
    end
  end

  resources :users do
    resources :messages, only: [:index, :show]
  end

  get '/profile', to: "users#profile", as: :profile
  get '/show', to: "users#show", as: :show

  get '/send-messages', to: "messages#send_messages", as: :sendmessages

  get '/companies', to: "userselections#select", as: :select
  get '/user_selections', to: "userselections#select", as: :user_selections
  post '/user_selections', to: "userselections#new", as: :new_user_selections
  delete '/user_selections/:id', to: "userselections#destroy", as: :destroy_user_selections
end
