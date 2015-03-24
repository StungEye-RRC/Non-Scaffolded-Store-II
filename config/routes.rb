Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # READING
  
  # When I receive a GET request to /products
  # load the index action of the products controller.
  get 'products' => 'products#index'
  # ^Verb  ^URL       ^Controller ^action
  
  # When we receive a GET request to /products/#
  # load the show action of the products controller.
  # The value of the url at the position :id ends up
  # in the params hash at params[:id]
  get 'products/:id' => 'products#show', as: 'product',  id: /\d+/ 
  
  # CREATING
  
  # A Route to display a new product form.
  get 'products/new' => 'products#new', as: 'new_product'
  post 'products' => 'products#create', as: 'create_product'
  
  # UPDATING
  
  get 'products/:id/edit' => 'products#edit', as: 'edit_product',  id: /\d+/ 
  patch 'products/:id' => 'products#update',   id: /\d+/ 
  
  # DELETING
  
  delete 'products/:id' => 'products#destroy', as: 'delete_product', id: /\d+/ 
  
  # A Route to handle the data posted by our new product form.
  
  root to: 'products#index'
end
