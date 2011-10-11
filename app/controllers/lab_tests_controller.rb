class LabTestsController < ApplicationController
  # GET /lab_tests
  # GET /lab_tests.json
  before_filter :find_client
  
  def find_client
    @client=Client.find(params[:client_id])
  end

  
  def index
    @lab_tests = LabTest.where(:client_id => @client.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_tests }
    end
  end

  # GET /lab_tests/1
  # GET /lab_tests/1.json
  def show
    @lab_test = LabTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_test }
    end
  end

  # GET /lab_tests/new
  # GET /lab_tests/new.json
  def new
    @lab_test = LabTest.new
    @lab_test.test_date=Time.now

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab_test }
    end
  end

  # GET /lab_tests/1/edit
  def edit
    @lab_test = LabTest.find(params[:id])
  end

  # POST /lab_tests
  # POST /lab_tests.json
  def create
    @lab_test = LabTest.new(params[:lab_test])
    @lab_test.client=@client


    respond_to do |format|
      if @lab_test.save
        format.html { redirect_to client_lab_tests_path(@client), notice: t(:lab_test_saved) }
        format.json { render json: @lab_test, status: :created, location: @lab_test }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_test.errors, status: :unprocessable_entity }
      end
    end
 end

  # PUT /lab_tests/1
  # PUT /lab_tests/1.json
  def update
    @lab_test = LabTest.find(params[:id])

    respond_to do |format|
      if @lab_test.update_attributes(params[:lab_test])
        format.html { redirect_to client_lab_tests_path(@client), notice: t(:lab_test_saved) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_tests/1
  # DELETE /lab_tests/1.json
  def destroy
    @lab_test = LabTest.find(params[:id])
    @lab_test.destroy

    respond_to do |format|
      format.html { redirect_to client_lab_tests_path(@client), notice: t(:lab_test_deleted) }
      format.json { head :ok }
    end
  end
end
