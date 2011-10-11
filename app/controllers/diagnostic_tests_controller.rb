class DiagnosticTestsController < ApplicationController
  # GET /diagnostic_tests
  # GET /diagnostic_tests.json
  before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @diagnostic_tests = @client.diagnostic_tests

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diagnostic_tests }
    end
  end

  # GET /diagnostic_tests/1
  # GET /diagnostic_tests/1.json
  def show
    @diagnostic_test = DiagnosticTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diagnostic_test }
    end
  end

  # GET /diagnostic_tests/new
  # GET /diagnostic_tests/new.json
  def new
    @diagnostic_test = DiagnosticTest.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diagnostic_test }
    end
  end

  # GET /diagnostic_tests/1/edit
  def edit
    @diagnostic_test = DiagnosticTest.find(params[:id])
  end

  # POST /diagnostic_tests
  # POST /diagnostic_tests.json
  def create
    @diagnostic_test = DiagnosticTest.new(params[:diagnostic_test])
    @diagnostic_test.client=@client

    respond_to do |format|
      if @diagnostic_test.save
        format.html { redirect_to client_diagnostic_tests_path(@client), notice: I18n.t(:record_saved) }
        format.json { render json: @diagnostic_test, status: :created, location: @diagnostic_test }
      else
        format.html { render action: "new" }
        format.json { render json: @diagnostic_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diagnostic_tests/1
  # PUT /diagnostic_tests/1.json
  def update
    @diagnostic_test = DiagnosticTest.find(params[:id])

    respond_to do |format|
      if @diagnostic_test.update_attributes(params[:diagnostic_test])
        format.html { redirect_to client_diagnostic_tests_path(@client), notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @diagnostic_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnostic_tests/1
  # DELETE /diagnostic_tests/1.json
  def destroy
    @diagnostic_test = DiagnosticTest.find(params[:id])
    @diagnostic_test.destroy

    respond_to do |format|
      format.html { redirect_to client_diagnostic_tests_url }
      format.json { head :ok }
    end
  end
end
