class Ref::SanatoriaController < ApplicationController
  # GET /ref/sanatoria
  # GET /ref/sanatoria.json
  def index
    @ref_sanatoria = Ref::Sanatorium.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_sanatoria }
    end
  end

  # GET /ref/sanatoria/1
  # GET /ref/sanatoria/1.json
  def show
    @ref_sanatorium = Ref::Sanatorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_sanatorium }
    end
  end

  # GET /ref/sanatoria/new
  # GET /ref/sanatoria/new.json
  def new
    @ref_sanatorium = Ref::Sanatorium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_sanatorium }
    end
  end

  # GET /ref/sanatoria/1/edit
  def edit
    @ref_sanatorium = Ref::Sanatorium.find(params[:id])
  end

  # POST /ref/sanatoria
  # POST /ref/sanatoria.json
  def create
    @ref_sanatorium = Ref::Sanatorium.new(params[:ref_sanatorium])

    respond_to do |format|
      if @ref_sanatorium.save
        format.html { redirect_to ref_sanatoria_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_sanatorium, status: :created, location: @ref_sanatorium }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_sanatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/sanatoria/1
  # PUT /ref/sanatoria/1.json
  def update
    @ref_sanatorium = Ref::Sanatorium.find(params[:id])

    respond_to do |format|
      if @ref_sanatorium.update_attributes(params[:ref_sanatorium])
        format.html { redirect_to ref_sanatoria_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_sanatorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/sanatoria/1
  # DELETE /ref/sanatoria/1.json
  def destroy
    @ref_sanatorium = Ref::Sanatorium.find(params[:id])
    @ref_sanatorium.destroy

    respond_to do |format|
      format.html { redirect_to ref_sanatoria_url }
      format.json { head :ok }
    end
  end
end
