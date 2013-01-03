class Project < ActiveRecord::Base
  attr_accessible :comments, :name,:client_id
  has_many :tickets
  belongs_to :client
end
