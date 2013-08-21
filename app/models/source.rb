class Source < ActiveRecord::Base
	has_many :products
  	
  	attr_accessible :name, :location, :description

  	  validates :name, :presence => :true
  	  validates :location, :presence => :true
  	  validates :description, :presence => :true
end
