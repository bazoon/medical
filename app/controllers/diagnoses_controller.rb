class DiagnosesController < ApplicationController
  # GET /diagnoses
  # GET /diagnoses.json

  before_filter :find_prof_inspection

  def find_prof_inspection
    @prof_inspection=ProfInspection.find(params[:prof_inspection_id])
  end


  def index
    @diagnoses = @prof_inspection.diagnosis

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diagnoses }
    end
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.json
  def show
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diagnosis }
    end
  end

  # GET /diagnoses/new
  # GET /diagnoses/new.json
  def new
    @diagnosis = Diagnosis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diagnosis }
    end
  end

  # GET /diagnoses/1/edit
  def edit
    @diagnosis = Diagnosis.find(params[:id])
  end

  # POST /diagnoses
  # POST /diagnoses.json
  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])
    @diagnosis.prof_inspection_id = @prof_inspection.id

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to client_prof_inspections_path(@prof_inspection.client), notice: I18n.t(:record_created) }
        format.json { render json: @diagnosis, status: :created, location: @diagnosis }
      else
        format.html { render action: "new" }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diagnoses/1
  # PUT /diagnoses/1.json
  def update
    @diagnosis = Diagnosis.find(params[:id])

    respond_to do |format|
      if @diagnosis.update_attributes(params[:diagnosis])
        format.html { redirect_to client_prof_inspections_path(@prof_inspection.client), notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.json
  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @id = @diagnosis.id
    @diagnosis.destroy

    respond_to do |format|
      format.html { redirect_to client_prof_inspections_path(@prof_inspection.client)}
      format.json { head :ok }
      format.js 
    end
  end
end
