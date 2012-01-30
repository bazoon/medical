class DispsController < ApplicationController
  # GET /disps
  # GET /disps.json
  before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @disps = @client.disps.page(params[:page]).per(10)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disps }
    end
  end

  # GET /disps/1
  # GET /disps/1.json
  def show
    @disp = Disp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disp }
    end
  end

  # GET /disps/new
  # GET /disps/new.json
  def new
    @disp = Disp.new
    @disp_mkbs = @client.mkbs

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disp }
    end
  end

  # GET /disps/1/edit
  def edit
    @disp = Disp.find(params[:id])
  end

  # POST /disps
  # POST /disps.json
  def create
    @disp = Disp.new(params[:disp])
    @disp.client=@client

    respond_to do |format|
      if @disp.save
        format.html { redirect_to client_disps_path(@client), notice: I18n.t(:record_created) }
        format.json { render json: @disp, status: :created, location: @disp }
      else
        format.html { render action: "new" }
        format.json { render json: @disp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disps/1
  # PUT /disps/1.json
  def update
    @disp = Disp.find(params[:id])

    respond_to do |format|
      if @disp.update_attributes(params[:disp])
        format.html { redirect_to client_disps_path(@client), notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @disp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disps/1
  # DELETE /disps/1.json
  def destroy
    @disp = Disp.find(params[:id])
    @disp.destroy

    respond_to do |format|
      format.html { redirect_to client_disps_url(@client) }
      format.json { head :ok }
    end
  end
end
