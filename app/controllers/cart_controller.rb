class CartController < ApplicationController


   def index
      @amount = session[:cart][:total]
      @amount_in_cents = @amount*100
   end 
   #This POST function is called when the user adds something to their cart. It
  #checks validations and then passes off the additional work of adding the item to the
  #cart to the add_detail_to_session function
  def add_to_cart

    @detail = OrderDetail.new(params[:order_detail])
    @product = Product.find(@detail.product_id)

    #If all the needed information is present
    if @detail.valid?

      #Add the detail to the session
  	  add_detail_to_session

  	  redirect_to products_path

    else
    	puts @detail.errors[:quantity]
    	render 'show'
    end 

  end

  #This functin is called by the add_to_cart POST method. It creates the cart if it does not exist and
  #it handles the case where the user is trying to add an item that already exists into the cart. It passes
  #the resonsibility of adding a new item to the cart to the add_new_detail method
  def add_detail_to_session

    cost = @product.price*@detail.quantity

    #If the cart does not exist, create it and add the detail to it
    if !session[:cart]
      session[:cart] = {}
      session[:cart][:details] = []
      session[:cart][:total] = 0
      add_new_detail

    #If the item already exists in the cart then update the item
    elsif session[:cart][:details].any? {|h| h[:product_id] == @detail.product_id}

      #Update Quantity
      item = session[:cart][:details].select {|f| f[:product_id] ==  @detail.product_id}.first
      item[:quantity] += @detail.quantity
      #Update Cost for that item
      item[:cost] = item[:cost] += cost

      #Update total
      session[:cart][:total] += cost

    #Otherwise, if the cart exists and the item is not in the cart yet, then add it to the cart
    else
      add_new_detail
    end
  end

  #This function only pushes a new hash of an order detail onto the array of details in the cart
  def add_new_detail
     cost = @product.price*@detail.quantity

     #Create a hash of the important info needed to add this to an order in the future
     detail_hash = {:product_id => @detail.product_id, :product_name => @product.name, 
                    :units => @product.unit, :quantity => @detail.quantity,
                    :cost => cost, :order_placement_date => @detail.order_placement_date, 
                    :order_pickup_date => @detail.order_pickup_date}

       session[:cart][:details].push(detail_hash)
       session[:cart][:total] += cost
  end


	def remove_from_cart

		#Loop through the cart until the item with the correct product id is found
		session[:cart][:details].each_with_index do |hash, index|
		
			#If found correct item, delete and change total
			if hash[:product_id] == params[:product_id].to_i
				session[:cart][:details].delete_at(index)
				session[:cart][:total] -= hash[:cost]
				break
			end
		end

		#If the cart is now empty, remove it to display correct message
		if session[:cart][:details].length == 0
			session[:cart] = nil
		end


		redirect_to products_path
	end

  def empty_cart
    session[:cart][:details].delete
    session[:cart][:total].delete
  end

end
