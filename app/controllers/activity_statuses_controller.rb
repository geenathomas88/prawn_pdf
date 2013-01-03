class ActivityStatusesController < ApplicationController
  # GET /activity_statuses
  # GET /activity_statuses.json
  def index
    @activity_statuses = ActivityStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_statuses }
    end
  end

  # GET /activity_statuses/1
  # GET /activity_statuses/1.json
  def show
    @activity_status = ActivityStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_status }
    end
  end

  # GET /activity_statuses/new
  # GET /activity_statuses/new.json
  def new
    @activity_status = ActivityStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_status }
    end
  end

  # GET /activity_statuses/1/edit
  def edit
    @activity_status = ActivityStatus.find(params[:id])
  end

  # POST /activity_statuses
  # POST /activity_statuses.json
  def create
    @activity_status = ActivityStatus.new(params[:activity_status])

    respond_to do |format|
      if @activity_status.save
        format.html { redirect_to @activity_status, notice: 'Activity status was successfully created.' }
        format.json { render json: @activity_status, status: :created, location: @activity_status }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_statuses/1
  # PUT /activity_statuses/1.json
  def update
    @activity_status = ActivityStatus.find(params[:id])

    respond_to do |format|
      if @activity_status.update_attributes(params[:activity_status])
        format.html { redirect_to @activity_status, notice: 'Activity status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_statuses/1
  # DELETE /activity_statuses/1.json
  def destroy
    @activity_status = ActivityStatus.find(params[:id])
    @activity_status.destroy

    respond_to do |format|
      format.html { redirect_to activity_statuses_url }
      format.json { head :no_content }
    end
  end
end
