Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:create, :new, :show]
  resources :parties do
    resources :items
    resources :guests
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :parties, only: :show

  get '/logout' => "sessions#destroy"

end
