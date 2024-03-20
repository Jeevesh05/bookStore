Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  #devise_for :users
  root "products#index"
  resources:products
  #get "/products", to: "products#index"
end
