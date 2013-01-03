class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @user = User.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @users = User.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  #  @group_user = @group.group_users.map(&:user_id)    
   # @user = User.find(:all, :conditions => ["id in (?)", @group_user])    
    #@users_selected = @user.map(&:id)    
    #@users = User.all
  end

  # POST /groups
  # POST /groups.json
  def create

    @group = Group.new(params[:group])
    @users = User.all
    respond_to do |format|
      if @group.save      
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id]) 
   
    respond_to do |format|
      if @group.update_attributes(params[:group])        
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy

    @group = Group.find(params[:id])
    @group.destroy
  
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
  # TODO - add the proper comments for each feature/ functionality
  def add_user
    @user = User.find(:all)
    @group = Group.find(params[:groupid])
    user_id = @group.users.map { |g| g.id }   
   # @group_user = @group.groups_users.map(&:user_id)    
    @user_selected = User.find(:all, :conditions => ["id in (?)", user_id])        
    @user_unselected = @user - @user_selected  

  #   render_text "The current time is #{Time.now.to_s}"
    render :layout => false
  end

  def assign_user    
    group_id = params[:groupid].to_i
    assign_users = params[:assign_users]

    if assign_users
      assign_users_id = assign_users.split(',').map(&:to_i)
      group_users = GroupUser.where("group_id = #{group_id}")
      group_users_id = group_users.map(&:user_id)      
      user_diff = (assign_users_id - group_users_id | group_users_id - assign_users_id).reject { |user_id| user_id.nil? }
      user_diff = group_users_id if user_diff.blank?      
      group = Group.where("id = #{group_id}")
      users = group[0].users
      selected_users = users.where(["id in (?)", user_diff])
      users.delete(selected_users)

      assign_users_id.each do |user_id|         
        is_groupuser = GroupUser.where(["user_id in (?) and group_id in (?)", user_id,group_id])                  
        group_user = GroupUser.create(:user_id => user_id, :group_id => params[:groupid]) if is_groupuser.size == 0
      end

    end         
    redirect_to groups_path
  end
end
