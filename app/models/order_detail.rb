#
# This is the order detail model. Each detail record keeps track of one item in the order, which is just a pointer to the product
# and the quantity of that product
#
class OrderDetail < ActiveRecord::Base
  belongs_to :order 
  belongs_to :product
  belongs_to :admin_order

  attr_accessible :quantity, :product_id, :order_placement_date, :order_pickup_date, :ordered, :admin_order_id,
  				  :taken

  validates :quantity, :presence => true

end
