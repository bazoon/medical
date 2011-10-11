class Ref::DoctorDeseasesController < ApplicationController
  # GET /ref/doctor_deseases
  # GET /ref/doctor_deseases.json
  def index
    @ref_doctor_deseases = Ref::DoctorDesease.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_doctor_deseases }
    end
  end


  # GET /ref/doctor_deseases/new
  # GET /ref/doctor_deseases/new.json
  def new
    @ref_doctor_desease = Ref::DoctorDesease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_doctor_desease }
    end
  end

  # GET /ref/doctor_deseases/1/edit
  def edit
    @ref_doctor_desease = Ref::DoctorDesease.find(params[:id])
  end

  # POST /ref/doctor_deseases
  # POST /ref/doctor_deseases.json
  def create
    @ref_doctor_desease = Ref::DoctorDesease.new(params[:ref_doctor_desease])

    respond_to do |format|
      if @ref_doctor_desease.save
        format.html { redirect_to ref_doctor_deseases_path, notice: I18n.t(:record_saved) }
        format.json { render json: @ref_doctor_desease, status: :created, location: @ref_doctor_desease }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_doctor_desease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/doctor_deseases/1
  # PUT /ref/doctor_deseases/1.json
  def update
    @ref_doctor_desease = Ref::DoctorDesease.find(params[:id])

    respond_to do |format|
      if @ref_doctor_desease.update_attributes(params[:ref_doctor_desease])
        format.html { redirect_to ref_doctor_deseases_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_doctor_desease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/doctor_deseases/1
  # DELETE /ref/doctor_deseases/1.json
  def destroy
    @ref_doctor_desease = Ref::DoctorDesease.find(params[:id])
    @ref_doctor_desease.destroy

    respond_to do |format|
      format.html { redirect_to ref_doctor_deseases_url }
      format.json { head :ok }
    end
  end
end
