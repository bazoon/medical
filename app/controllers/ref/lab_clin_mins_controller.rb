class Ref::LabClinMinsController < ApplicationController
  # GET /ref/lab_clin_mins
  # GET /ref/lab_clin_mins.json
  def index
    @ref_lab_clin_mins = Ref::LabClinMin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_lab_clin_mins }
    end
  end

  # GET /ref/lab_clin_mins/1
  # GET /ref/lab_clin_mins/1.json
  def show
    @ref_lab_clin_min = Ref::LabClinMin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_lab_clin_min }
    end
  end

  # GET /ref/lab_clin_mins/new
  # GET /ref/lab_clin_mins/new.json
  def new
    @ref_lab_clin_min = Ref::LabClinMin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_lab_clin_min }
    end
  end

  # GET /ref/lab_clin_mins/1/edit
  def edit
    @ref_lab_clin_min = Ref::LabClinMin.find(params[:id])
  end

  # POST /ref/lab_clin_mins
  # POST /ref/lab_clin_mins.json
  def create
    @ref_lab_clin_min = Ref::LabClinMin.new(params[:ref_lab_clin_min])

    respond_to do |format|
      if @ref_lab_clin_min.save
        format.html { redirect_to ref_lab_clin_mins_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_lab_clin_min, status: :created, location: @ref_lab_clin_min }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_lab_clin_min.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/lab_clin_mins/1
  # PUT /ref/lab_clin_mins/1.json
  def update
    @ref_lab_clin_min = Ref::LabClinMin.find(params[:id])

    respond_to do |format|
      if @ref_lab_clin_min.update_attributes(params[:ref_lab_clin_min])
        format.html { redirect_to ref_lab_clin_mins_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_lab_clin_min.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/lab_clin_mins/1
  # DELETE /ref/lab_clin_mins/1.json
  def destroy
    @ref_lab_clin_min = Ref::LabClinMin.find(params[:id])
    @ref_lab_clin_min.destroy

    respond_to do |format|
      format.html { redirect_to ref_lab_clin_mins_url }
      format.json { head :ok }
    end
  end
end
