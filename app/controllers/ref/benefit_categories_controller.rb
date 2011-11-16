  # GET /ref/benefit_categories.json
  def index
    @ref_benefit_categories = Ref::BenefitCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ref_benefit_categories }
    end
  end

  # GET /ref/benefit_categories/1
  # GET /ref/benefit_categories/1.json
  def show
    @ref_benefit_category = Ref::BenefitCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ref_benefit_category }
    end
  end

  # GET /ref/benefit_categories/new
  # GET /ref/benefit_categories/new.json
  def new
    @ref_benefit_category = Ref::BenefitCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ref_benefit_category }
    end
  end

  # GET /ref/benefit_categories/1/edit
  def edit
    @ref_benefit_category = Ref::BenefitCategory.find(params[:id])
  end

  # POST /ref/benefit_categories
  # POST /ref/benefit_categories.json
  def create
    @ref_benefit_category = Ref::BenefitCategory.new(params[:ref_benefit_category])

    respond_to do |format|
      if @ref_benefit_category.save
        format.html { redirect_to ref_benefit_categories_path, notice: I18n.t(:record_created) }
        format.json { render json: @ref_benefit_category, status: :created, location: @ref_benefit_category }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_benefit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ref/benefit_categories/1
  # PUT /ref/benefit_categories/1.json
  def update
    @ref_benefit_category = Ref::BenefitCategory.find(params[:id])

    respond_to do |format|
      if @ref_benefit_category.update_attributes(params[:ref_benefit_category])
        format.html { redirect_to ref_benefit_categories_path, notice: I18n.t(:record_updated) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ref_benefit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ref/benefit_categories/1
  # DELETE /ref/benefit_categories/1.json
  def destroy
    @ref_benefit_category = Ref::BenefitCategory.find(params[:id])
    @ref_benefit_category.destroy

    respond_to do |format|
      format.html { redirect_to ref_benefit_categories_url }
      format.json { head :ok }
    end
  end
end
