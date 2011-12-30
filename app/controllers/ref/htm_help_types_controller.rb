class Ref::HtmHelpTypesController < ApplicationController
  # GET /ref/htm_help_types
  # GET /ref/htm_help_types.json
  def index
    @ref_htm_help_types = Ref::HtmHelpType.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_htm_help_types }
    end
  end

  # GET /ref/htm_help_types/1
  # GET /ref/htm_help_types/1.json
  def show
    @ref_htm_help_type = Ref::HtmHelpType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_htm_help_type }
    end
  end

  # GET /ref/htm_help_types/new
  # GET /ref/htm_help_types/new.json
  def new
    @ref_htm_help_type = Ref::HtmHelpType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_htm_help_type }
    end
  end

  # GET /ref/htm_help_types/1/edit
  def edit
    @ref_htm_help_type = Ref::HtmHelpType.find(params[:id])
  end

  # POST /ref/htm_help_types
  # POST /ref/htm_help_types.json
  def create
    @ref_htm_help_type = Ref::HtmHelpType.new(params[:ref_htm_help_type])

    respond_to do |format|
      if @ref_htm_help_type.save
        format.html { redirect_to ref_htm_help_types_path, notice: I18n.t(:record_created)}
        format.json { render json: @ref_htm_help_type, status: :created, location: @ref_htm_help_type }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_htm_help_type.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /ref/htm_help_types/1
  # PUT /ref/htm_help_types/1.json
  def update
    @ref_htm_help_type = Ref::HtmHelpType.find(params[:id])

    respond_to do |format|
      if @ref_htm_help_type.update_attributes(params[:ref_htm_help_type])
        format.html { redirect_to ref_htm_help_types_path, notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_htm_help_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/htm_help_types/1
  # DELETE /ref/htm_help_types/1.json
  def destroy
    @ref_htm_help_type = Ref::HtmHelpType.find(params[:id])
    @ref_htm_help_type.destroy

    respond_to do |format|
      format.html { redirect_to ref_htm_help_types_url }
      format.json { head :ok }
    end
  end
end
