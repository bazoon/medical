class Ref::DoctorTypesController < ApplicationController
  # GET /ref/doctor_types
  # GET /ref/doctor_types.json
  def index
    @ref_doctor_types = Ref::DoctorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_doctor_types }
    end
  end

  # GET /ref/doctor_types/1
  # GET /ref/doctor_types/1.json
  def show
    @ref_doctor_type = Ref::DoctorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_doctor_type }
    end
  end

  # GET /ref/doctor_types/new
  # GET /ref/doctor_types/new.json
  def new
    @ref_doctor_type = Ref::DoctorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_doctor_type }
    end
  end

  # GET /ref/doctor_types/1/edit
  def edit
    @ref_doctor_type = Ref::DoctorType.find(params[:id])
  end

  # POST /ref/doctor_types
  # POST /ref/doctor_types.json
  def create
    @ref_doctor_type = Ref::DoctorType.new(params[:ref_doctor_type])

    respond_to do |format|
      if @ref_doctor_type.save
        format.html { redirect_to ref_doctor_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_doctor_type, status: :created, location: @ref_doctor_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_doctor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/doctor_types/1
  # PUT /ref/doctor_types/1.json
  def update
    @ref_doctor_type = Ref::DoctorType.find(params[:id])

    respond_to do |format|
      if @ref_doctor_type.update_attributes(params[:ref_doctor_type])
        format.html { redirect_to ref_doctor_types_path, notic: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_doctor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/doctor_types/1
  # DELETE /ref/doctor_types/1.json
  def destroy
    @ref_doctor_type = Ref::DoctorType.find(params[:id])
    @ref_doctor_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_doctor_types_url }
      format.json { head :ok }
    end
  end
end
