class User < ActiveRecord::Base  
  has_and_belongs_to_many :groups, :join_table => 'groups_users'
  has_one :ticket
  validates_presence_of :associate_id, :associate_name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :associate_id, :associate_name
    #attr_accessor :associate_id, :associate_name    
  attr_accessible :associate_id, :associate_name
end