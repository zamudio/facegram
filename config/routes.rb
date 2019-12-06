Rails.application.routes.draw do

  root 'sessions#new', as: 'login'

  resources :posts
  put '/posts/:id/likes', to: 'posts#likes', as: 'likes'

  resources :profiles, only: :index
  get '/home', to: 'profiles#index'

  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'

end
