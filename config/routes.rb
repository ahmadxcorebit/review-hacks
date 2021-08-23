Rails.application.routes.draw do
  get 'users/show'
  root 'home#index'
  devise_for :users
  resources :users, only:[:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
