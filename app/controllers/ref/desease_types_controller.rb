class Ref::DeseaseTypesController < ApplicationController
  # GET /ref/desease_types
  # GET /ref/desease_types.json
  def index
    @ref_desease_types = Ref::DeseaseType.order('name').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_desease_types }
    end
  end

  # GET /ref/desease_types/1
  # GET /ref/desease_types/1.json
  def show
    @ref_desease_type = Ref::DeseaseType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_desease_type }
    end
  end

  # GET /ref/desease_types/new
  # GET /ref/desease_types/new.json
  def new
    @ref_desease_type = Ref::DeseaseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_desease_type }
    end
  end

  # GET /ref/desease_types/1/edit
  def edit
    @ref_desease_type = Ref::DeseaseType.find(params[:id])
  end

  # POST /ref/desease_types
  # POST /ref/desease_types.json
  def create
    @ref_desease_type = Ref::DeseaseType.new(params[:ref_desease_type])

    respond_to do |format|
      if @ref_desease_type.save
        format.html { redirect_to ref_desease_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_desease_type, status: :created, location: @ref_desease_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_desease_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/desease_types/1
  # PUT /ref/desease_types/1.json
  def update
    @ref_desease_type = Ref::DeseaseType.find(params[:id])

    respond_to do |format|
      if @ref_desease_type.update_attributes(params[:ref_desease_type])
        format.html { redirect_to ref_desease_types_path, notice: I18n.t(:record_created) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_desease_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/desease_types/1
  # DELETE /ref/desease_types/1.json
  def destroy
    @ref_desease_type = Ref::DeseaseType.find(params[:id])
    @ref_desease_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_desease_types_url }
      format.json { head :ok }
    end
  end
end
