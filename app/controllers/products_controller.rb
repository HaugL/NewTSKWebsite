class ProductsController < ApplicationController

  def show
  	@product = Product.find(params[:id])
  	@detail = OrderDetail.new()

  end

  def index
  	@products = Product.all
  end

  # This method runs special searches, code in product model, and then renders the index view
  def search
  end
 
 #############################################
 ## ADMIN METHODS

  def new
  	@product = Product.new
    @categories = Category.all
  	render 'edit'
  end

  def create
  	@product = Product.new(params[:product])

  	if @product.save
  		redirect_to products_path
  	else
  		render 'edit'
  	end

  end

  #########################

  def edit
  end

  def update
  end

  #########################

  def destroy
  	
  end
end

