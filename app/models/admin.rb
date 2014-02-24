class Admin < ActiveRecord::Base
  has_and_belongs_to_many :members, :join_table => :members_admins
  belongs_to :resource, :polymorphic => true
  
  scopify
  # attr_accessible :title, :body
end
