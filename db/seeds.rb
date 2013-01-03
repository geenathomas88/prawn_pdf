# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user group called "Admin" by default
#----------------------groups&users&groups_users----------------------------#	
@group = Group.create(:group_name => "Admin")
users_hash = [{:associate_name=>"Gaurav Laddha", :associate_id => 289092,:email => "Gaurav.Laddha@cognizant.com",
				:password => "admin123"},
				{:associate_name=>"Sairaj Vaithilingam", :associate_id => 102028,:email => "Sairaj.Vaithilingam@cognizant.com",
				:password => "admin123"},
				{:associate_name=>"Vijai Ekambaram", :associate_id => 146581,:email => "Vijai.Ekambaram@cognizant.com",
				:password => "admin123"},
				{:associate_name=>"Ajay Singh", :associate_id => 210449,:email => "Ajay.Singh@cognizant.com",
				:password => "admin123"}]
users_hash.each do |user_hash|
	@user = User.create(user_hash)
	GroupUser.create(:user_id => @user.id, :group_id =>@group.id)
end
@group1 = Group.create(:group_name => "Scheduler")
users_hash = [{:associate_name=>"Rajeswar PS", :associate_id => 351271,:email => "Rajeswar.Subramani@cognizant.com",
				:password => "admin123"},
				{:associate_name=>"Munendra Chevuru", :associate_id => 322231,:email => "munendra.chevuru@cognizant.com",
				:password => "admin123"}]
users_hash.each do |user_hash|
	@user1 = User.create(user_hash)
	GroupUser.create(:user_id => @user1.id, :group_id =>@group1.id)
end	
@group2 = Group.create(:group_name => "Production")
users_hash = [{:associate_name=>"Gousalya Arivoli", :associate_id => 355550,:email => "Gousalya.Arivoli@cognizant.com",
				:password => "admin123"}]
users_hash.each do |user_hash|
	@user2 = User.create(user_hash)
	GroupUser.create(:user_id => @user2.id, :group_id =>@group2.id)
end	
@group3 = Group.create(:group_name => "QA")
users_hash = [{:associate_name=>"Geena Thomas", :associate_id => 355487,:email => "Geena.Thomas@cognizant.com",
		:password => "admin123"}]
users_hash.each do |user_hash|
	@user3 = User.create(user_hash)
	GroupUser.create(:user_id => @user3.id, :group_id =>@group3.id)
end
#----------------------roles----------------------------------#
@role = Role.create(:name => "Developer")
#-------------------activity--------------------#
@activity = Activity.create(:name => "Quote")
@activity = Activity.create(:name => "New")
@activity = Activity.create(:name => "NCN Resolved")
@activity = Activity.create(:name => "Modification")
@activity = Activity.create(:name => "Delivered")
@activity = Activity.create(:name => "Cancel")
#-------------------activity_statuses-------------------------#
@activity_status = ActivityStatus.create(:name => "Scheduler")
@activity_status = ActivityStatus.create(:name => "Prevalidation Start")
@activity_status = ActivityStatus.create(:name => "Prevalidation End")
@activity_status = ActivityStatus.create(:name => "Allocation")
@activity_status = ActivityStatus.create(:name => "Production Start")
@activity_status = ActivityStatus.create(:name => "Production End")
@activity_status = ActivityStatus.create(:name => "QA Strat")
@activity_status = ActivityStatus.create(:name => "QA End")
@activity_status = ActivityStatus.create(:name => "NCN Start")
@activity_status = ActivityStatus.create(:name => "NCN End")
@activity_status = ActivityStatus.create(:name => "Production Complete")
@activity_status = ActivityStatus.create(:name => "Onsite Review Start")
@activity_status = ActivityStatus.create(:name => "Onsite Review Closed")
@activity_status = ActivityStatus.create(:name => "Agency Review Start")
@activity_status = ActivityStatus.create(:name => "Agency Review Close")
@activity_status = ActivityStatus.create(:name => "Deliver")
#----------------------brands----------------------------------#
@brand = Brand.create(:name => "ATACAND")
@brand = Brand.create(:name => "DUTOPROL")
@brand = Brand.create(:name => "NEXIUM")
@brand = Brand.create(:name => "CRESTOR")
@brand = Brand.create(:name => "VIMOVO")
@brand = Brand.create(:name => "ARIMIDEX")
@brand = Brand.create(:name => "Symbicort")
#----------------------products---------------------------------#
@product = Product.create(:name => "Print")
@product = Product.create(:name => "Email")
@product = Product.create(:name => "Flash")
@product = Product.create(:name => "Web")
#----------------------priorities-------------------------------#
@priority = Priority.create(:name => "Critical")
@priority = Priority.create(:name => "High")
@priority = Priority.create(:name => "Medium")
@priority = Priority.create(:name => "Low")
#----------------------categories-------------------------------#
@category = Category.create(:name => "Atlas")
@category = Category.create(:name => "AOR")
@category = Category.create(:name => "Convention")
#----------------------change_types-------------------------------# 
@change_type = ChangeType.create(:name => "CRC")
@change_type = ChangeType.create(:name => "CTS Error")
#------------------------clients----------------------------------# 
@client = Client.create(:client_name => "Ebay",:client_contact => "1/123, abc Street, xyz Nagar")
@client = Client.create(:client_name => "Cognizant",:client_contact => "1/123, abc Street, xyz Nagar")
@client = Client.create(:client_name => "Comcast",:client_contact => "1/123, new Street, xyz Nagar")
#@client3 = Client.create(:client_name => "Zevents",:client_contact => "1/123, new Street, xyz Nagar")
#@client4 = Client.create(:client_name => "Mattel",:client_contact => "1/123, new Street, xyz Nagar")
#@client5 = Client.create(:client_name => "Ford",:client_contact => "1/123, new Street, xyz Nagar")
#------------------------projects----------------------------------# 
@project = Project.create(:name => "TODO", :comments => "Project 1", :client_id => 1)
@project = Project.create(:name => "PingMe", :comments => "Project 2", :client_id => 1)
@project = Project.create(:name => "Touchstone", :comments => "Project 3", :client_id => 2)
@project = Project.create(:name => "Damp", :comments => "Project 4", :client_id => 2)
@project = Project.create(:name => "Comcast", :comments => "Project 5", :client_id => 3)
#------------------------job_regions-------------------------------# 
@job_region = JobRegion.create(:name=> "North America")
@job_region = JobRegion.create(:name=> "India")
@job_region = JobRegion.create(:name=> "Australia")
@job_region = JobRegion.create(:name=> "United Kingdom")