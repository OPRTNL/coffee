Rails.application.routes.draw do
  root to: 'partners#index'
  devise_for :users

  resources :products, only: [:index, :show]

  resources :partners

  resources :users, only: [:show, :edit, :update]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
