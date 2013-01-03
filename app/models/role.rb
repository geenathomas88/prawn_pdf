class Role < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :permission_id, :description  
end
