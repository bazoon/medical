class Ref::MkbTypesController < ApplicationController
  # GET /ref/mkb_types
  # GET /ref/mkb_types.json
  def index
    @ref_mkb_types = Ref::MkbType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_mkb_types }
    end
  end

  # GET /ref/mkb_types/1
  # GET /ref/mkb_types/1.json
  def show
    @ref_mkb_type = Ref::MkbType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_mkb_type }
    end
  end

  # GET /ref/mkb_types/new
  # GET /ref/mkb_types/new.json
  def new
    @ref_mkb_type = Ref::MkbType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_mkb_type }
    end
  end

  # GET /ref/mkb_types/1/edit
  def edit
    @ref_mkb_type = Ref::MkbType.find(params[:id])
  end

  # POST /ref/mkb_types
  # POST /ref/mkb_types.json
  def create
    @ref_mkb_type = Ref::MkbType.new(params[:ref_mkb_type])

    respond_to do |format|
      if @ref_mkb_type.save
        format.html { redirect_to ref_mkb_types_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_mkb_type, status: :created, location: @ref_mkb_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_mkb_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/mkb_types/1
  # PUT /ref/mkb_types/1.json
  def update
    @ref_mkb_type = Ref::MkbType.find(params[:id])

    respond_to do |format|
      if @ref_mkb_type.update_attributes(params[:ref_mkb_type])
        format.html { redirect_to ref_mkb_types_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_mkb_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/mkb_types/1
  # DELETE /ref/mkb_types/1.json
  def destroy
    @ref_mkb_type = Ref::MkbType.find(params[:id])
    @ref_mkb_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_mkb_types_url }
      format.json { head :ok }
    end
  end
end
