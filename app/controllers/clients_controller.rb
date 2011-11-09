class ClientsController < ApplicationController


  def operations
    begin
     @client = Client.includes(:mkbs =>:mkb_type,:benefits => :benefit_category,:prof_inspections => [:diagnoses,:user => :doctor_type],:lab_tests => :lab_test_type).find(params[:id])
#     @client = Client.find(params[:id])
     session[:client_id] = @client.id
    rescue ActiveRecord::RecordNotFound
      redirect_to clients_path
    end
  end

  
  # GET /clients
  # GET /clients.json
  def index
    @clients =Client.search(params[:search]).page(params[:page])
    
    if @clients && @clients.size == 1
      redirect_to operations_client_path(@clients[0])
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @clients }
      end
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @ti="Hello clients"

    output = ClientReport.new.to_pdf
    
#  words = "Hello There"
#   Prawn::Document.generate "example.pdf" do |pdf|
#   pdf.text words
#  end
  
    send_data output, :filename => "hello.pdf",:type => "application/pdf"

#   @client = Client.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @client }
#      format.pdf 
#    end
#    #
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    @client.attach_date=Date.parse(Time.now.to_s)
   # @client.detach_date=Date.parse(Time.now.to_s)
    @client.client_sex_id=1




    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end


  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  #  render :text => @client.phones
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: t(:patient_saved) }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to operations_client_path(@client), notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :ok }
    end
  end
end
