class ProductsController < ApplicationController

  def show
  	@product = Product.find(params[:id])
  	@detail = OrderDetail.new()
    @source = @product.source

    set_order_and_pickup_dates(@product)

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
    @days = Day.all

  	render 'edit'
  end

  def create
  	@product = Product.new(params[:product])
    @days = Day.all

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
###############################################


private

def set_order_and_pickup_dates(product)
  order_by_day = product.order_by_day
  pickup_day = product.pick_up_day

  current_time = Time.now
  current_day = current_time.wday

  #Get the next order_by_day
  if current_day <= order_by_day
    difference = (order_by_day-current_day)
    @order_by_date = current_time + difference.days
  else
    difference = (current_day - order_by_day)
    @order_by_date = current_time +(7-difference).days
  end

  if order_by_day <= pickup_day
    difference = pickup_day - order_by_day
    @pick_up_date = @order_by_date + difference.days
  else
    difference = order_by_day - pickup_day
    @pick_up_date = @order_by_date + (7 - difference).days
  end


end


end
