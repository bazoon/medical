class Ref::LabTestTypesController < ApplicationController
  # GET /ref/lab_test_types
  # GET /ref/lab_test_types.json
  #
  

  def index
    @ref_lab_test_types = Ref::LabTestType.page(params[:page]).per(10)
 #   @lab_test_type =@ref_lab_test_types[0] 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_lab_test_types }
    end
  end

  # GET /ref/lab_test_types/new
  # GET /ref/lab_test_types/new.json
  def new
    @ref_lab_test_type = Ref::LabTestType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_lab_test_type }
    end
  end

  # GET /ref/lab_test_types/1/edit
  def edit
    @ref_lab_test_type = Ref::LabTestType.find(params[:id])
  end

  # POST /ref/lab_test_types
  # POST /ref/lab_test_types.json
  def create
    @ref_lab_test_type = Ref::LabTestType.new(params[:ref_lab_test_type])

    respond_to do |format|
      if @ref_lab_test_type.save
        format.html { redirect_to ref_lab_test_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_lab_test_type, status: :created, location: @ref_lab_test_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_lab_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/lab_test_types/1
  # PUT /ref/lab_test_types/1.json
  def update
    @ref_lab_test_type = Ref::LabTestType.find(params[:id])

    respond_to do |format|
      if @ref_lab_test_type.update_attributes(params[:ref_lab_test_type])
        format.html { redirect_to ref_lab_test_types_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_lab_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/lab_test_types/1
  # DELETE /ref/lab_test_types/1.json
  def destroy
    @ref_lab_test_type = Ref::LabTestType.find(params[:id])
    @ref_lab_test_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_lab_test_types_url }
      format.json { head :ok }
    end
  end
end
