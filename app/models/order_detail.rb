#
# This is the order detail model. Each detail record keeps track of one item in the order, which is just a pointer to the product
# and the quantity of that product
#
class OrderDetail < ActiveRecord::Base
  belongs_to :order 
  belongs_to :product

  attr_accessible :quantity, :product_id, :ordered, :taken

  validates :quantity, :presence => true

end
