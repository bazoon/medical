class Ref::DiagnosticTestTypesController < ApplicationController
  # GET /ref/diagnostic_test_types
  # GET /ref/diagnostic_test_types.json
  def index
    @ref_diagnostic_test_types = Ref::DiagnosticTestType.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_diagnostic_test_types }
    end
  end

  # GET /ref/diagnostic_test_types/1
  # GET /ref/diagnostic_test_types/1.json
  def show
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_diagnostic_test_type }
    end
  end

  # GET /ref/diagnostic_test_types/new
  # GET /ref/diagnostic_test_types/new.json
  def new
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_diagnostic_test_type }
    end
  end

  # GET /ref/diagnostic_test_types/1/edit
  def edit
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.find(params[:id])
  end

  # POST /ref/diagnostic_test_types
  # POST /ref/diagnostic_test_types.json
  def create
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.new(params[:ref_diagnostic_test_type])

    respond_to do |format|
      if @ref_diagnostic_test_type.save
        format.html { redirect_to ref_diagnostic_test_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_diagnostic_test_type, status: :created, location: @ref_diagnostic_test_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_diagnostic_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/diagnostic_test_types/1
  # PUT /ref/diagnostic_test_types/1.json
  def update
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.find(params[:id])

    respond_to do |format|
      if @ref_diagnostic_test_type.update_attributes(params[:ref_diagnostic_test_type])
        format.html { redirect_to ref_diagnostic_test_types_path, notice:  I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_diagnostic_test_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/diagnostic_test_types/1
  # DELETE /ref/diagnostic_test_types/1.json
  def destroy
    @ref_diagnostic_test_type = Ref::DiagnosticTestType.find(params[:id])
    @ref_diagnostic_test_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_diagnostic_test_types_url }
      format.json { head :ok }
    end
  end
end
