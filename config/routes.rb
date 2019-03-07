Rails.application.routes.draw do
  root to: 'pages#home'
  # get 'partner', to: 'pages#partner'

  devise_for :users

  resources :partners do
    resources :products
    # resources :orders
    member do
      get :counter
    end
  end

  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]

    member do
      patch :consume
    end
  end

  resources :users, only: [:show, :edit, :update]

  resources :products, only: [] do
    member do
      get :generate_order
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

