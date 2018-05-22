Rails.application.routes.draw do
  get 'password_resets/new'

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :companies, except: :index do
    resources :messages
    member do
      put "like" => "companies#upvote"
      put "unlike" => "companies#downvote"
    end
  end

  resources :messages, only: [:index, :show]
  resources :contacts, only: [:new, :create]

  resources :password_resets

  get '/profile', to: "users#profile", as: :profile
  get '/show', to: "users#show", as: :show
  get '/overview', to: "companies#overview", as: :overview
  get '/about', to: "pages#about"
  get '/how-does-it-work', to: "pages#how_does_it_work"

  # mount using default path: /email_processor
  mount_griddler

  get '/send-messages', to: "messages#send_messages", as: :sendmessages

  delete 'avatar' => 'users#delete_avatar', as: :delete_avatar

  # Terms of Service and Privacy Policy
  get '/terms-of-service', to: "pages#terms_of_service"
  get '/privacy-policy', to: "pages#privacy_policy"
  get '/cookies', to: "pages#cookies"

  get '/companies', to: "userselections#select", as: :select

  # --- User selections routes ---

  get '/user_selections', to: "userselections#select", as: :user_selections

  post '/user_selections', to: "userselections#create", as: :new_user_selections

  delete '/user_selections/:id', to: "userselections#destroy", as: :destroy_user_selections
end
