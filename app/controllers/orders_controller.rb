class OrdersController < ApplicationController
  

  ##############################################

  def index
  	@orders = Member.find(session[:member_id]).orders
  end 

  def show
    @order = Order.find(params[:id])
    member_id = session[:member_id]

    if member_id.nil? or @order.member_id != member_id
      redirect_to root_path
    end 

  	@order_details = @order.order_details
  end



   
end
