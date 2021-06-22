Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: [:show, :index]
  resources :carts, only: [:index]
  resources :checkouts, only: [:index]
  resources :contacts, only: [:index]
  put 'products/:id', to: 'products#add_quantity', as: 'add_quantity'
  get '/pay', to: "checkouts#pay"
  devise_for :customers
  root 'products#index'
end
