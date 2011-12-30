class Ref::InsCompaniesController < ApplicationController
  # GET /ref/ins_companies
  # GET /ref/ins_companies.json
  def index
    @ref_ins_companies = Ref::InsCompany.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_ins_companies }
    end
  end

  # GET /ref/ins_companies/1
  # GET /ref/ins_companies/1.json
  def show
    @ref_ins_company = Ref::InsCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_ins_company }
    end
  end

  # GET /ref/ins_companies/new
  # GET /ref/ins_companies/new.json
  def new
    @ref_ins_company = Ref::InsCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_ins_company }
    end
  end

  # GET /ref/ins_companies/1/edit
  def edit
    @ref_ins_company = Ref::InsCompany.find(params[:id])
  end

  # POST /ref/ins_companies
  # POST /ref/ins_companies.json
  def create
    @ref_ins_company = Ref::InsCompany.new(params[:ref_ins_company])

    respond_to do |format|
      if @ref_ins_company.save
        format.html { redirect_to ref_ins_companies_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_ins_company, status: :created, location: @ref_ins_company }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_ins_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/ins_companies/1
  # PUT /ref/ins_companies/1.json
  def update
    @ref_ins_company = Ref::InsCompany.find(params[:id])

    respond_to do |format|
      if @ref_ins_company.update_attributes(params[:ref_ins_company])
        format.html { redirect_to ref_ins_companies_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_ins_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/ins_companies/1
  # DELETE /ref/ins_companies/1.json
  def destroy
    @ref_ins_company = Ref::InsCompany.find(params[:id])
    @ref_ins_company.destroy

    respond_to do |format|
      format.html { redirect_to ref_ins_companies_url }
      format.json { head :ok }
    end
  end
end
