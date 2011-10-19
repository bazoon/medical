class MkbsController < ApplicationController
  # GET /mkbs
  # GET /mkbs.json
  #
  #
  before_filter :find_client
  
  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @mkbs = Mkb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mkbs }
    end
  end

  # GET /mkbs/1
  # GET /mkbs/1.json
  def show
    @mkb = Mkb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mkb }
    end
  end

  # GET /mkbs/new
  # GET /mkbs/new.json
  def new
    @mkb = Mkb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mkb }
    end
  end

  # GET /mkbs/1/edit
  def edit
    @mkb = Mkb.find(params[:id])
  end

  # POST /mkbs
  # POST /mkbs.json
  def create
    @mkb = Mkb.new(params[:mkb])
    @mkb.client_id = @client.id

    respond_to do |format|
      if @mkb.save
        format.html { redirect_to client_mkbs_path(@client), notice: I18n.t(:record_created) }
        format.json { render json: @mkb, status: :created, location: @mkb }
      else
        format.html { render action: "new" }
        format.json { render json: @mkb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mkbs/1
  # PUT /mkbs/1.json
  def update
    @mkb = Mkb.find(params[:id])

    respond_to do |format|
      if @mkb.update_attributes(params[:mkb])
        format.html { redirect_to client_mkbs_path(@client), notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mkb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mkbs/1
  # DELETE /mkbs/1.json
  def destroy
    @mkb = Mkb.find(params[:id])
    @mkb.destroy

    respond_to do |format|
      format.html { redirect_to client_mkbs_path(@client) }
      format.json { head :ok }
    end
  end
end
