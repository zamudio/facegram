Rails.application.routes.draw do

  root 'sessions#login'

  resources :posts #, only: [:show, :new, :edit, :update, :destroy]

  resources :profiles, only: :index
  get '/home', to: 'profiles#index'

  resources :users #, only: [:new, :create, :edit, :update, :destroy]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'




  put '/posts/:id/likes', to: 'posts#likes', as: 'likes'
end
