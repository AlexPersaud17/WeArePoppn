Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:create, :new, :show]
  resources :parties
  resources :sessions, only: [:new, :create, :destroy]
  resources :items

  get '/logout' => "sessions#destroy"

end
