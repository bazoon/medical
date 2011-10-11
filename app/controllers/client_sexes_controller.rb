class ClientSexesController < ApplicationController
  # GET /client_sexes
  # GET /client_sexes.json
  def index
    @client_sexes = ClientSex.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_sexes }
    end
  end

  # GET /client_sexes/1
  # GET /client_sexes/1.json
  def show
    @client_sex = ClientSex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_sex }
    end
  end

  # GET /client_sexes/new
  # GET /client_sexes/new.json
  def new
    @client_sex = ClientSex.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_sex }
    end
  end

  # GET /client_sexes/1/edit
  def edit
    @client_sex = ClientSex.find(params[:id])
  end

  # POST /client_sexes
  # POST /client_sexes.json
  def create
    @client_sex = ClientSex.new(params[:client_sex])

    respond_to do |format|
      if @client_sex.save
        format.html { redirect_to @client_sex, notice: 'Client sex was successfully created.' }
        format.json { render json: @client_sex, status: :created, location: @client_sex }
      else
        format.html { render action: "new" }
        format.json { render json: @client_sex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_sexes/1
  # PUT /client_sexes/1.json
  def update
    @client_sex = ClientSex.find(params[:id])

    respond_to do |format|
      if @client_sex.update_attributes(params[:client_sex])
        format.html { redirect_to @client_sex, notice: 'Client sex was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_sex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_sexes/1
  # DELETE /client_sexes/1.json
  def destroy
    @client_sex = ClientSex.find(params[:id])
    @client_sex.destroy

    respond_to do |format|
      format.html { redirect_to client_sexes_url }
      format.json { head :ok }
    end
  end
end
