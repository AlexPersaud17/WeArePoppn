Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:create, :new, :show]
  resources :parties do
    resources :items, only: [:create, :new,] do
      resources :list_items, only: :create
    end
    resources :guests, only: [:new, :create]
  end
  resources :items, only: :show
  resources :sessions, only: [:new, :create, :destroy]
  resources :parties, only: :show

  get '/logout' => "sessions#destroy"

end
