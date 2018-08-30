Rails.application.routes.draw do

  root 'users#index'
  resource :session, only: :create
  resources :users, only: :index
  resources :products, only: [:index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
