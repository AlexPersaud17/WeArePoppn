Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, except: [:index, :destroy]
  resources :parties do
    resources :comments, only: [:new, :create]
    resources :items, only: [:create, :new, :destroy] do
      resources :list_items, only: [:create, :destroy]
    end
    resources :guests, only: [:new, :create, :destroy]
  end
  resources :items, only: :show
  resources :sessions, only: [:new, :create, :destroy]
  resources :parties, only: :show

  get '/logout' => "sessions#destroy"

end
