Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  mount RailsAdmin::Engine => '/admin', as: :rails_admin

  root 'home#index'
end
