Rails.application.routes.draw do
  devise_for :users
  resources :books
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :invoices
  resources :orders
  mount RailsAdmin::Engine => '/admin', as: :rails_admin

  root 'home#index'
end
