class HospitalizationsController < ApplicationController
  # GET /hospitalizations
  # GET /hospitalizations.json
 before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @hospitalizations = @client.hospitalizations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hospitalizations }
    end
  end

  # GET /hospitalizations/1
  # GET /hospitalizations/1.json
  def show
    @hospitalization = Hospitalization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hospitalization }
    end
  end

  # GET /hospitalizations/new
  # GET /hospitalizations/new.json
  def new
    @hospitalization = Hospitalization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hospitalization }
    end
  end

  # GET /hospitalizations/1/edit
  def edit
    @hospitalization = Hospitalization.find(params[:id])
  end

  # POST /hospitalizations
  # POST /hospitalizations.json
  def create
    @hospitalization = Hospitalization.new(params[:hospitalization])
    @hospitalization.client=@client


    respond_to do |format|
      if @hospitalization.save
        format.html { redirect_to client_hospitalizations_path(@client), notice: I18n.t(:record_created) }
        format.json { render json: @hospitalization, status: :created, location: @hospitalization }
      else
        format.html { render action: "new" }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hospitalizations/1
  # PUT /hospitalizations/1.json
  def update
    @hospitalization = Hospitalization.find(params[:id])

    respond_to do |format|
      if @hospitalization.update_attributes(params[:hospitalization])
        format.html { redirect_to client_hospitalizations_path(@client), notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hospitalization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitalizations/1
  # DELETE /hospitalizations/1.json
  def destroy
    @hospitalization = Hospitalization.find(params[:id])
    @hospitalization.destroy

    respond_to do |format|
      format.html { redirect_to client_hospitalizations_url(@client) }
      format.json { head :ok }
    end
  end
end
