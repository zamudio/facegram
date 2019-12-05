Rails.application.routes.draw do

  resources :users
  # tiff
  # resources :users

  # post '/signup', to: "users#new", as: 'signup'

  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#logout', as: 'logout'

  # taylor
  # resources :users
  # resources :sessions   # restrict?

  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#logout'

  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'

end
