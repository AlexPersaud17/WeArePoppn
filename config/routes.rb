Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:create, :new, :show]
  resources :parties do
    resources :items, only: [:create, :new]
    resources :guests, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]

  get '/logout' => "sessions#destroy"

end
