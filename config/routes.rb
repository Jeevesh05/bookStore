Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  #devise_for :users
  root "products#index"
  resources:products
  #get "/products", to: "products#index"
  resources :users
  resources :sellers
  get 'my_products', to: 'products#my_products'
end
