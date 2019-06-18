class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.xml
  def index
    @budgets = Budget.paginate :page => params[:page], :per_page => 30, :include => :category, :order => 'YEAR(start_date) desc, MONTH(start_date) desc, categories.name'
	@months = 'January','February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'

	@current_budget_month = Date.today.month.to_s 
	@previous_budget_month = Date.today.month.to_s 
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @budgets }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.xml
  def new
    @budget = Budget.new
	@categories = Category.find(:all)
	@transaction_types = TransactionType.find(:all)
	@frequency_types = FrequencyType.find(:all)
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
	@categories = Category.find(:all)
	@transaction_types = TransactionType.find(:all)
	@frequency_types = FrequencyType.find(:all)
  end

  # POST /budgets
  # POST /budgets.xml
  def create
    @budget = Budget.new(params[:budget])
	if (!params['category'].blank?)
			@new_category = Category.new
			@new_category.name = params['category']
			@new_category.save
			@budget.categories_id = Category.find_by_name(params['category']).id			
	end
	@categories = Category.find(:all)
	@transaction_types = TransactionType.find(:all)
	
    respond_to do |format|
      if @budget.save
        flash[:notice] = 'Budget was successfully created.'
        format.html { redirect_to(budgets_url) }
        format.xml  { render :xml => @budget, :status => :created, :location => budgets_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.xml
  def update
    @budget = Budget.find(params[:id])
	if (!params['category'].blank?)
			@new_category = Category.new
			@new_category.name = params['category']
			@new_category.save
			params['budget']['categories_id'] = Category.find_by_name(params['category']).id			
	end
	@categories = Category.find(:all)
	@transaction_types = TransactionType.find(:all)
	
    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        flash[:notice] = 'Budget was successfully updated.'
        format.html { redirect_to(budgets_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.xml
  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to(budgets_url) }
      format.xml  { head :ok }
    end
  end
end
