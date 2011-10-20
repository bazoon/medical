class ProfInspectionsController < ApplicationController
  # GET /prof_inspections
  # GET /prof_inspections.json
  
  before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end
  
  
  def index
   @prof_inspections = @client.prof_inspections.page(params[:page]).per(12)
   @prof_inspection_groups = @prof_inspections.group_by {|p| p.actual_date.year}


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prof_inspections }
    end
  end

  def year
    @client=Client.find(params[:client_id])
    @year=params[:year]

    start_date=Date.new(@year.to_i,1,1)
    end_date=Date.new(@year.to_i,12,31)
    @prof_inspections=ProfInspection.where("actual_date between ? and ?",start_date,end_date)
#    render :text => @prof_inspections.count
#
    respond_to do |format|
      format.js 
    end


  end


  # GET /prof_inspections/1
  # GET /prof_inspections/1.json
  def show
    @prof_inspection = ProfInspection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prof_inspection }
    end
  end

  # GET /prof_inspections/new
  # GET /prof_inspections/new.json
  def new
    @prof_inspection = ProfInspection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prof_inspection }
    end
  end

  # GET /prof_inspections/1/edit
  def edit
    @prof_inspection = ProfInspection.find(params[:id])
  end

  # POST /prof_inspections
  # POST /prof_inspections.json
  def create
    @prof_inspection = ProfInspection.new(params[:prof_inspection])
    @prof_inspection.client=@client

    respond_to do |format|
      if @prof_inspection.save
        format.html { redirect_to client_prof_inspections_path(@client), notice: I18n.t(:record_created)}
        format.json { render json: @prof_inspection, status: :created, location: @prof_inspection }
      else
        format.html { render action: "new" }
        format.json { render json: @prof_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prof_inspections/1
  # PUT /prof_inspections/1.json
  def update
    @prof_inspection = ProfInspection.find(params[:id])

    respond_to do |format|
      if @prof_inspection.update_attributes(params[:prof_inspection])
        format.html { redirect_to client_prof_inspections_path(@client), notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prof_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prof_inspections/1
  # DELETE /prof_inspections/1.json
  def destroy
    @prof_inspection = ProfInspection.find(params[:id])
    @prof_inspection.destroy

    respond_to do |format|
      format.html { redirect_to client_prof_inspections_path(@client) }
      format.json { head :ok }
    end
  end
end
