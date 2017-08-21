Rails.application.routes.draw do

  root 'sessions#index'
  resources :attractions
  resources :users
  resources :sessions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
