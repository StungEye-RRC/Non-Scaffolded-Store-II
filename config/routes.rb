Rails.application.routes.draw do
  # When I receive a GET request to /products
  # load the index action of the products controller.
  get 'products' => 'products#index'
  # ^Verb  ^URL       ^Controller ^action
  
  root to: 'products#index'
end
