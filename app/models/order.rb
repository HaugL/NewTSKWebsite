# 
# This is the order model. It acts as a connector for all the order details to one event and it manages 
# how much the order costs, if it was paid and what it was paid with
#
class Order < ActiveRecord::Base
  belongs_to :member

  has_many :order_details, :dependent => :destroy

  attr_accessible :cost, :member_id

  validates :cost, :presence => :true
  # validates :member_id, :presence => :true
end
