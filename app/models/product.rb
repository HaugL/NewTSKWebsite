#
# This is the product model. It contains all the information about each product, including it's units, source and quantity in stock.
#

class Product < ActiveRecord::Base
  has_many :order_details
  belongs_to :category

  attr_accessible  :name, :image, :unit, :price, :category_id

   mount_uploader :image, ImageUploader

  validates :name, :presence => :true
  validates :image, :presence => :true

  validates :unit, :presence => :true
  validates :price, :presence => :true
 
end
