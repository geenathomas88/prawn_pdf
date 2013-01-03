class Client < ActiveRecord::Base
  attr_accessible :client_contact, :client_name
  has_many :tickets
  has_many :projects
end
