Rails.application.routes.draw do

  resources :posts
  get '/home', to: 'posts#index'

  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/user/:username', to: 'users#show'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'

  # tiff
  # post '/signup', to: "users#new", as: 'signup'
  # get '/logout', to: 'sessions#logout', as: 'logout'

  # taylor
  # resources :sessions   # restrict?

end
