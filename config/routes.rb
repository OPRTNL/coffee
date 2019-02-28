Rails.application.routes.draw do
  root to: 'pages#home'
  # get 'partner', to: 'pages#partner'

  devise_for :users

  resources :partners do
    resources :products
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
