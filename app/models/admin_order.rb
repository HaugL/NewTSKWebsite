class AdminOrder < ActiveRecord::Base

  has_many :order_details
  belongs_to :product

  attr_accessible :quantity, :ready_for_pickup, :expected_pickup_date, :product_id

  validates_presence_of :product_id
  validates_presence_of :quantity
end
