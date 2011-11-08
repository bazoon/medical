class Ref::DeathReasonsController < ApplicationController
  # GET /ref/death_reasons
  # GET /ref/death_reasons.json
  def index
    @ref_death_reasons = Ref::DeathReason.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_death_reasons }
    end
  end

  # GET /ref/death_reasons/1
  # GET /ref/death_reasons/1.json
  def show
    @ref_death_reason = Ref::DeathReason.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_death_reason }
    end
  end

  # GET /ref/death_reasons/new
  # GET /ref/death_reasons/new.json
  def new
    @ref_death_reason = Ref::DeathReason.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_death_reason }
    end
  end

  # GET /ref/death_reasons/1/edit
  def edit
    @ref_death_reason = Ref::DeathReason.find(params[:id])
  end

  # POST /ref/death_reasons
  # POST /ref/death_reasons.json
  def create
    @ref_death_reason = Ref::DeathReason.new(params[:ref_death_reason])

    respond_to do |format|
      if @ref_death_reason.save
        format.html { redirect_to ref_death_reasons_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_death_reason, status: :created, location: @ref_death_reason }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_death_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/death_reasons/1
  # PUT /ref/death_reasons/1.json
  def update
    @ref_death_reason = Ref::DeathReason.find(params[:id])

    respond_to do |format|
      if @ref_death_reason.update_attributes(params[:ref_death_reason])
        format.html { redirect_to ref_death_reasons_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_death_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/death_reasons/1
  # DELETE /ref/death_reasons/1.json
  def destroy
    @ref_death_reason = Ref::DeathReason.find(params[:id])
    @ref_death_reason.destroy

    respond_to do |format|
      format.html { redirect_to ref_death_reasons_url }
      format.json { head :ok }
    end
  end
end
