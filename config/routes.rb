Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  #devise_for :users
  root "products#index"
  resources :products
  resources :users
  resources :sellers
  #get "/products", to: "products#index"
end
