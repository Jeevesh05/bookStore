Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  resources :users
  resources :sellers
  root "products#index"
  get 'my_products', to: 'products#my_products'
  get "search", to: "products#search"
  get '/cart', to: 'carts#show', as: 'cart'

  resources :products do
    post 'add_to_cart', on: :member
  end
  resources :carts do
     delete 'destroy_item/:cart_item_id', action: :destroy_item, on: :member, as: 'destroy_item'
     patch 'update_quantity/:cart_item_id', action: :update_quantity, on: :member, as: 'update_quantity'
  end
end
