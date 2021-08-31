Rails.application.routes.draw do
  get 'home/index'
  root 'products#index'
  devise_for :users
  resources :users, only:[:show]
  resources :products
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
