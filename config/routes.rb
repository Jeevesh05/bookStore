Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  #devise_for :users
  root "products#index"
  resources :products do
    post 'add_to_cart', on: :member
  end
  resources :users
  resources :sellers
  #get "/products", to: "products#index"
  get "search", to: "product#search"
  get '/cart', to: 'carts#show', as: 'cart'
  resources :carts do
     delete 'destroy_item/:cart_item_id', action: :destroy_item, on: :member, as: 'destroy_item'
     patch 'update_quantity/:cart_item_id', action: :update_quantity, on: :member, as: 'update_quantity'
  end
  resources :users
  resources :sellers
  get 'my_products', to: 'products#my_products'
end
