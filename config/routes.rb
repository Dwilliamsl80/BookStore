Rails.application.routes.draw do
  devise_for :users
  resources :books
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  mount RailsAdmin::Engine => '/admin', as: :rails_admin

  root 'home#index'
  get 'pages/about'
end
