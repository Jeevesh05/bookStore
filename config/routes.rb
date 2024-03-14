Rails.application.routes.draw do
  root "products#index"
  resources:products
  #get "/products", to: "products#index"
end
