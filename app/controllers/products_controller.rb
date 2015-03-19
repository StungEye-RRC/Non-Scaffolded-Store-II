class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  # By default, after a controller action is execute an associated view
  # will be auto-loaded: app/views/products/index.html.erb
  # This view will have access to all the action's instance variables.
  
  def show
    @product = Product.find(params[:id])
  end
  # By default, the app/views/products/show.html.erb will be loaded with
  # access to the show method's instance variables.
  
  def new
    @product = Product.new
  end
  # app/views/products/new.html.erb
  
  def create
    @product = Product.new(product_params)
    
    if (@product.save)
      redirect_to @product
    else
      render :new
    end
    
  end
  # No associated view, so there is no need for app/views/products/create.html.erb
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if (@product.update_attributes(product_params))
      redirect_to @product
    else
      render :edit
    end
  end
  # No associated view here. Just a redirect or a render.
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image_filename)
  end
end
