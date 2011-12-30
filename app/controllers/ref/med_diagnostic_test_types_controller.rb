class Ref::MedDiagnosticTestTypesController < ApplicationController
  # GET /ref/med_diagnostic_test_types
  # GET /ref/med_diagnostic_test_types.json
  def index
    @ref_med_diagnostic_test_types = Ref::MedDiagnosticTestType.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_med_diagnostic_test_types }
    end
  end

  # GET /ref/med_diagnostic_test_types/1
  # GET /ref/med_diagnostic_test_types/1.json
  def show
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_med_diagnostic_test_type }
    end
  end

  # GET /ref/med_diagnostic_test_types/new
  # GET /ref/med_diagnostic_test_types/new.json
  def new
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_med_diagnostic_test_type }
    end
  end

  # GET /ref/med_diagnostic_test_types/1/edit
  def edit
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.find(params[:id])
  end

  # POST /ref/med_diagnostic_test_types
  # POST /ref/med_diagnostic_test_types.json
  def create
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.new(params[:ref_med_diagnostic_test_type])

    respond_to do |format|
      if @ref_med_diagnostic_test_type.save
        format.html { redirect_to ref_med_diagnostic_test_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_med_diagnostic_test_type, status: :created, location: @ref_med_diagnostic_test_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_med_diagnostic_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/med_diagnostic_test_types/1
  # PUT /ref/med_diagnostic_test_types/1.json
  def update
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.find(params[:id])

    respond_to do |format|
      if @ref_med_diagnostic_test_type.update_attributes(params[:ref_med_diagnostic_test_type])
        format.html { redirect_to ref_med_diagnostic_test_types_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_med_diagnostic_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/med_diagnostic_test_types/1
  # DELETE /ref/med_diagnostic_test_types/1.json
  def destroy
    @ref_med_diagnostic_test_type = Ref::MedDiagnosticTestType.find(params[:id])
    @ref_med_diagnostic_test_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_med_diagnostic_test_types_url }
      format.json { head :ok }
    end
  end
end
