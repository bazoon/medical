class MsesController < ApplicationController
  # GET /mses
  # GET /mses.json
  #
  #


  before_filter :find_client
  
  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @mses = Mse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mses }
    end
  end

  # GET /mses/1
  # GET /mses/1.json
  def show
    @mse = Mse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mse }
    end
  end

  # GET /mses/new
  # GET /mses/new.json
  def new
    @mse = Mse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mse }
    end
  end

  # GET /mses/1/edit
  def edit
    @mse = Mse.find(params[:id])
  end

  # POST /mses
  # POST /mses.json
  def create
    @mse = Mse.new(params[:mse])
    @mse.client_id = @client.id


    respond_to do |format|
      if @mse.save
        format.html { redirect_to @mse, notice: 'Mse was successfully created.' }
        format.json { render json: @mse, status: :created, location: @mse }
      else
        format.html { render action: "new" }
        format.json { render json: @mse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mses/1
  # PUT /mses/1.json
  def update
    @mse = Mse.find(params[:id])

    respond_to do |format|
      if @mse.update_attributes(params[:mse])
        format.html { redirect_to @mse, notice: 'Mse was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mses/1
  # DELETE /mses/1.json
  def destroy
    @mse = Mse.find(params[:id])
    @mse.destroy

    respond_to do |format|
      format.html { redirect_to mses_url }
      format.json { head :ok }
    end
  end
end
