class Ref::MkbsController < ApplicationController
  # GET /ref/mkbs
  # GET /ref/mkbs.json
  def index
    @ref_mkbs = Ref::Mkb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_mkbs }
    end
  end

  # GET /ref/mkbs/1
  # GET /ref/mkbs/1.json
  def show
    @ref_mkb = Ref::Mkb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_mkb }
    end
  end

  # GET /ref/mkbs/new
  # GET /ref/mkbs/new.json
  def new
    @ref_mkb = Ref::Mkb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_mkb }
    end
  end

  # GET /ref/mkbs/1/edit
  def edit
    @ref_mkb = Ref::Mkb.find(params[:id])
  end

  # POST /ref/mkbs
  # POST /ref/mkbs.json
  def create
    @ref_mkb = Ref::Mkb.new(params[:ref_mkb])

    respond_to do |format|
      if @ref_mkb.save
        format.html { redirect_to @ref_mkb, notice: 'Mkb was successfully created.' }
        format.json { render json: @ref_mkb, status: :created, location: @ref_mkb }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_mkb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/mkbs/1
  # PUT /ref/mkbs/1.json
  def update
    @ref_mkb = Ref::Mkb.find(params[:id])

    respond_to do |format|
      if @ref_mkb.update_attributes(params[:ref_mkb])
        format.html { redirect_to @ref_mkb, notice: 'Mkb was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_mkb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/mkbs/1
  # DELETE /ref/mkbs/1.json
  def destroy
    @ref_mkb = Ref::Mkb.find(params[:id])
    @ref_mkb.destroy

    respond_to do |format|
      format.html { redirect_to ref_mkbs_url }
      format.json { head :ok }
    end
  end
end
