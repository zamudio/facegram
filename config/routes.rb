Rails.application.routes.draw do

  resources :posts
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#logout'

  # resources :posts

  # tiff
  # post '/signup', to: "users#new", as: 'signup'
  # get '/logout', to: 'sessions#logout', as: 'logout'

  # taylor
  # resources :sessions   # restrict?

end
