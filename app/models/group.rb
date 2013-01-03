class Group < ActiveRecord::Base
	has_and_belongs_to_many :users , :join_table => 'groups_users'
	validates_presence_of :group_name
  	attr_accessible :group_name, :description  
end