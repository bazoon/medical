class ClientsController < ApplicationController




  def operations
    @client = Client.find(params[:id])
  end

  
  # GET /clients
  # GET /clients.json
  def index
    
#    if params[:search].nil?
#     @clients = Client.order("surname").page(params[:page])
#    else
#     @clients = Client.where("surname like ?",params[:search])
#    end 

 #   @clients = Client.where("surname like ?",params[:search])

 #   render :text => params[:search]
    
#    @clients =Client.search(params[:search]).order("surname").page(params[:page])
    @clients =Client.search(params[:search]).page(params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    @client.attach_date=Time.now
    @client.detach_date=Time.now
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
        format.html { redirect_to @client, notice: I18n.t(:record_updated) }
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
