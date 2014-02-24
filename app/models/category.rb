class Category < ActiveRecord::Base
  has_many :products
  attr_accessible :name
  validates_presence_of :name, :on => :create
end
