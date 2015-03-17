class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  # By default, after a controller action is execute an associated view
  # will be auto-loaded: app/views/products/index.html.erb
  # This view will have access to all the action's instance variables.
end
