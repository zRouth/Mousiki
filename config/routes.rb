Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/artist/:name', to: 'artists#show'
  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout' => 'sessions#destroy', as: 'signout'
  resources :sessions
  resources :users
  resources :artists, only: [:index, :create, :update, :destroy, :edit]

  root 'welcome#index'
end
