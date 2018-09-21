Rails.application.routes.draw do

  root 'products#index'
  resource :session, only: [:create, :destroy]
  resource :cart, only: [:edit, :update], controller: 'cart'
  resources :users, only: :index
  resources :products, only: [:index, :show, :update]
  resources :purchases, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
