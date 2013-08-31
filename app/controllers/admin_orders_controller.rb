class AdminOrdersController < ApplicationController

	def index
		@recent_orders = AdminOrder.where("ready_for_pickup = ?", false)
		@past_orders = AdminOrder.where("ready_for_pickup = ?", true).limit(5)
    end
	def show
	end

	################################################
	def new
		#Orders that need to be made
		cut_off_order_details = OrderDetail.where("Date(order_placement_date) < ? AND ordered = ?", Time.now, false)
		needed_orders_grouped_by_date = cut_off_order_details.group_by(&:order_placement_date)
		@needed_orders_grouped_by_order_date_and_product = group_by_product(needed_orders_grouped_by_date)

		#Orders that are still accumulating
		in_progress_order_details = OrderDetail.where("Date(order_placement_date) >= ? AND ordered = ?", Time.now, false)
		in_progress_orders_grouped_by_date = in_progress_order_details.group_by(&:order_placement_date)
		@in_progess_orders_grouped_by_order_date_and_product = group_by_product(in_progress_orders_grouped_by_date)

		@admin_order = AdminOrder.new

	end 

	def create
		admin_order = AdminOrder.create(:quantity => params[:admin_order][:quantity],
					   :expected_pickup_date => params[:admin_order][:expected_pickup_date],
					   :product_id => params[:admin_order][:product_id])
		update_all_affected_order_details(admin_order, params[:admin_order][:order_by_date])

        redirect_to admin_orders_path
    end

    #################################################

    def edit
    end

    def update
    end 

    ##################################################
    private
    def group_by_product(grouped_details)
    	needed_orders = {}
    	grouped_details.each do |detail_set|
    		date = detail_set[0]
    		hash_for_date = {}

    		detail_set[1].each do |order_detail|
    			if hash_for_date[order_detail.product_id].nil?
    				hash_for_date[order_detail.product_id] = {:quantity => order_detail.quantity, 
    									:expected_pickup_date => order_detail.order_pickup_date}
    			else
    				hash_for_date[order_detail.product_id][:quantity] += order_detail.quantity
    			end
    		end
    		needed_orders[date] = hash_for_date
    	end
    	return needed_orders
    end

    def getQuantityOfProduct(date_set)
    	quantity = 0
    	date_set.each do |detail|
    		quantity += detail.quantity
    	end
    	return quantity
    end

    def update_all_affected_order_details(admin_order, order_by_date)
    	order_details = OrderDetail.where("order_placement_date = ? AND product_id = ? AND ordered = ?",
    									   order_by_date, admin_order.product_id, false)

    	order_details.each do |detail|
    		detail.ordered = true
    		detail.admin_order_id = admin_order.id
    		detail.save
    	end

    end
end
