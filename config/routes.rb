Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/artist/:name', to: 'artists#show'
  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :artists

  root 'welcome#index'
end
