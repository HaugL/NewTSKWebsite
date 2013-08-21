class ChargesController < ApplicationController

	def create
		  @amount = params[:amount].to_d
		  @amount_in_cents = (@amount * 100).to_i


		  customer = Stripe::Customer.create(
		    :email => 'example@stripe.com',
		    :card  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount_in_cents,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
		else
			order = create_order(@amount)
			session.delete(:cart)
			redirect_to order_path(order)
		end
	end

	def create_order(amount) 
		order = Order.create(:cost => amount, :member_id => session[:member_id])
		session[:cart][:details].each do |detail|
			order.order_details.create(:quantity => detail[:quantity], :product_id => detail[:product_id], 
									:order_placement_date => detail[:order_placement_date],
									:order_pickup_date => detail[:order_pickup_date])
		end
		
		return order

	end

