class TicketsController < ApplicationController
  require 'csv'
  # GET /tickets
  # GET /tickets.json
  def index
   if current_user.groups[0]
      puts current_user.groups[0].group_name
      if (current_user.groups[0].group_name == "QA") or (current_user.groups[0].group_name == "Production")
           
         @tickets =  Ticket.where("user_id = '#{current_user.id}'").paginate page: params[:page], order: 'created_at desc',per_page: 10
           
      else 
         @tickets = Ticket.paginate page: params[:page], order: 'created_at desc',per_page: 10
      end  
   else
    @tickets = Ticket.paginate page: params[:page], order: 'created_at desc',per_page: 10        
   end
  # @tickets = Ticket.paginate page: params[:page], order: 'created_at desc',per_page: 10         
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }          
    end

  end

  def show_tic
    @ticket = Ticket.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @ticket }      
  end
 end
  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
      format.pdf do
        pdf = TicketPdf.new(@ticket, view_context)
        send_data pdf.render, filename:
        "Ticket_#{@ticket.job_ticket_no}.pdf",
        type: "application/pdf"
      end
      end
    end
 

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new
    @ticket.job_ticket_no = Ticket.last.job_ticket_no.to_i+1 if Ticket.last
    @client=Client.all
    @brand = Brand.all
    @activity = Activity.all
    @activity_status = ActivityStatus.all
    @change_type = ChangeType.all
    @priority = Priority.all
    @product = Product.all
    @job_region = JobRegion.all
    @user = []
    @project=[]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @brand = Brand.all
    @client=Client.find(@ticket.client_id) if @ticket.client_id
    @activity = Activity.all
    @activity_status = ActivityStatus.all
    @change_type = ChangeType.all
    @priority = Priority.all
    @product = Product.all
    @job_region = JobRegion.all
    @user = []
    @project = []
    @project = Project.where(:client_id => @ticket.client_id) if @ticket.client_id
    @user = User.where(:id => @ticket.user_id) if @ticket.user_id
    @ticket_user = @ticket.user.groups[0].group_name
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_path, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to tickets_path, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
 
   # FIND PROJECT
   def find_project
    @projects=Client.find(params[:id]).projects    
    render :json => @projects
   end
   
   #Find user based on QA/Production
   def find_user    
     @group = Group.find_by_group_name(params[:id])
     puts @group.users.inspect
     render :json => @group.users

   end
     
end
