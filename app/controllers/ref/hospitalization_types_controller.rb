class Ref::HospitalizationTypesController < ApplicationController
  # GET /ref/hospitalization_types
  # GET /ref/hospitalization_types.json
  def index
    @ref_hospitalization_types = Ref::HospitalizationType.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_hospitalization_types }
    end
  end

  # GET /ref/hospitalization_types/1
  # GET /ref/hospitalization_types/1.json
  def show
    @ref_hospitalization_type = Ref::HospitalizationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_hospitalization_type }
    end
  end

  # GET /ref/hospitalization_types/new
  # GET /ref/hospitalization_types/new.json
  def new
    @ref_hospitalization_type = Ref::HospitalizationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_hospitalization_type }
    end
  end

  # GET /ref/hospitalization_types/1/edit
  def edit
    @ref_hospitalization_type = Ref::HospitalizationType.find(params[:id])
  end

  # POST /ref/hospitalization_types
  # POST /ref/hospitalization_types.json
  def create
    @ref_hospitalization_type = Ref::HospitalizationType.new(params[:ref_hospitalization_type])

    respond_to do |format|
      if @ref_hospitalization_type.save
        format.html { redirect_to ref_hospitalization_types_path, notic: I18n.t(:record_created)}
        format.json { render json: @ref_hospitalization_type, status: :created, location: @ref_hospitalization_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_hospitalization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/hospitalization_types/1
  # PUT /ref/hospitalization_types/1.json
  def update
    @ref_hospitalization_type = Ref::HospitalizationType.find(params[:id])

    respond_to do |format|
      if @ref_hospitalization_type.update_attributes(params[:ref_hospitalization_type])
        format.html { redirect_to ref_hospitalization_types_path, notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_hospitalization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/hospitalization_types/1
  # DELETE /ref/hospitalization_types/1.json
  def destroy
    @ref_hospitalization_type = Ref::HospitalizationType.find(params[:id])
    @ref_hospitalization_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_hospitalization_types_url }
      format.json { head :ok }
    end
  end
end
