class Brand < ActiveRecord::Base
  attr_accessible :name
  has_one :ticket
end
