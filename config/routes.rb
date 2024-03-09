Rails.application.routes.draw do
  root "products#index"

  get "/products", to: "products#index"
end
