class GroupUser < ActiveRecord::Base	
  self.table_name = 'groups_users'  
  attr_accessible :group_id, :user_id  
  belongs_to :user
  belongs_to :group
end
