#
# This is the product model. It contains all the information about each product, including it's units, source and quantity in stock.
#

class Product < ActiveRecord::Base
  belongs_to :source

  belongs_to :order_detail

  attr_accessible  :name, :image, :source_id, :source_notes, :unit, :price

   mount_uploader :image, ImageUploader

  validates :name, :presence => :true
  validates :image, :presence => :true
  validates :source_id, :presence => :true

  validates :unit, :presence => :true
  validates :price, :presence => :true
 
end
