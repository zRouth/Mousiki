Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/artist/:name', to: 'artists#show'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :artists

  root to: 'welcome#index'
end
