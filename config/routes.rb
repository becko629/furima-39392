Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :users,only: [:show]
  resources :items
  resources :purchase_records,only: [:index, :create]
end
