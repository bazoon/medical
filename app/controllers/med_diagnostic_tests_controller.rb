class MedDiagnosticTestsController < ApplicationController
  # GET /med_diagnostic_tests
  # GET /med_diagnostic_tests.json
  before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @med_diagnostic_tests = @client.med_diagnostic_tests.page(params[:page]).per(10)



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @med_diagnostic_tests }
    end
  end

  # GET /med_diagnostic_tests/1
  # GET /med_diagnostic_tests/1.json
  def show
    @med_diagnostic_test = MedDiagnosticTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @med_diagnostic_test }
    end
  end

  # GET /med_diagnostic_tests/new
  # GET /med_diagnostic_tests/new.json
  def new
    @med_diagnostic_test = MedDiagnosticTest.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @med_diagnostic_test }
    end
  end

  # GET /med_diagnostic_tests/1/edit
  def edit
    @med_diagnostic_test = MedDiagnosticTest.find(params[:id])
  end

  # POST /med_diagnostic_tests
  # POST /med_diagnostic_tests.json
  def create
    @med_diagnostic_test = MedDiagnosticTest.new(params[:med_diagnostic_test])
    @med_diagnostic_test.client=@client


    respond_to do |format|
      if @med_diagnostic_test.save
        format.html { redirect_to client_med_diagnostic_tests_path(@client), notice: I18n.t(:record_saved) }
        format.json { render json: @med_diagnostic_test, status: :created, location: @med_diagnostic_test }
      else
        format.html { render action: "new" }
        format.json { render json: @med_diagnostic_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /med_diagnostic_tests/1
  # PUT /med_diagnostic_tests/1.json
  def update
    @med_diagnostic_test = MedDiagnosticTest.find(params[:id])

    respond_to do |format|
      if @med_diagnostic_test.update_attributes(params[:med_diagnostic_test])
        format.html { redirect_to client_med_diagnostic_tests_path(@client), notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @med_diagnostic_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /med_diagnostic_tests/1
  # DELETE /med_diagnostic_tests/1.json
  def destroy
    @med_diagnostic_test = MedDiagnosticTest.find(params[:id])
    @med_diagnostic_test.destroy

    respond_to do |format|
      format.html { redirect_to client_med_diagnostic_tests_url }
      format.json { head :ok }
    end
  end
end
