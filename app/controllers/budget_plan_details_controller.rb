class BudgetPlanDetailsController < ApplicationController

  def index
	redirect_to :action => "monthly"
  end

  def monthly
	if request.post?
		@selected_month = params[:date][:month].to_i
		@selected_year = params[:date][:year].to_i
	else
		@selected_month = Date.today.month
		@selected_year = Date.today.year
	end
	
	@monthly_expenses = ActiveRecord::Base.connection.select_all("SELECT categories.name, categories.note, budgets.budget_amount as 'monthly_budget', frequency_types.frequency as 'frequency', sum(transactions.amount) as 'amount_spent', YEAR(budgets.start_date) as 'year', MONTH(budgets.start_date) as 'month' FROM categories, budgets LEFT JOIN transactions on budgets.categories_id = transactions.categories_id AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date), transaction_types, frequency_types WHERE categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND transaction_types.name = 'Expense' AND budgets.frequency_types_id = frequency_types.id GROUP BY budgets.start_date, budgets.categories_id ORDER BY budgets.start_date, categories.name, transactions.date")
	@monthly_income = ActiveRecord::Base.connection.select_all("SELECT categories.name, categories.note, budgets.budget_amount as 'monthly_budget', frequency_types.frequency as 'frequency', sum(transactions.amount) as 'amount_earned', YEAR(budgets.start_date) as 'year', MONTH(budgets.start_date) as 'month' FROM categories, budgets LEFT JOIN transactions on budgets.categories_id = transactions.categories_id AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date), transaction_types, frequency_types WHERE categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND transaction_types.name = 'Deposit' AND budgets.frequency_types_id = frequency_types.id GROUP BY budgets.start_date, budgets.categories_id ORDER BY budgets.start_date, categories.name, transactions.date")
	
	@months = 'January','February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
	@m_budget_total = 0 
	@m_amount_total = 0 
	@first_record = 1 #boolean variable to control looping in budgets
	@month 
  end
  
  def yearly
  	if request.post?
		@selected_year = params[:date][:year].to_i
	else
		@selected_year = Date.today.year
	end
	@monthly_expenses = ActiveRecord::Base.connection.select_all("SELECT categories.name, budgets.budget_amount as budget, frequency_types.frequency as 'frequency', sum(transactions.amount) as amount_spent, YEAR(budgets.start_date) as year, MONTH(budgets.start_date) as month FROM transactions, categories, budgets, transaction_types, frequency_types WHERE categories.id = transactions.categories_id AND categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND frequency_types.id = budgets.frequency_types_id AND transaction_types.name = 'Expense' AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date) GROUP BY year, month, name, budgets.budget_amount ORDER BY year DESC, month, categories.name")
	@monthly_income = ActiveRecord::Base.connection.select_all("SELECT categories.name, budgets.budget_amount as budget, frequency_types.frequency as 'frequency', sum(transactions.amount) as amount_spent, YEAR(budgets.start_date) as year, MONTH(budgets.start_date) as month FROM transactions, categories, budgets, transaction_types, frequency_types WHERE categories.id = transactions.categories_id AND categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND frequency_types.id = budgets.frequency_types_id AND transaction_types.name = 'Deposit' AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date) GROUP BY year, month, name, budgets.budget_amount ORDER BY year DESC, month, categories.name")
	
	@yearly_expenses = ActiveRecord::Base.connection.select_all("SELECT categories.name, sum(budgets.budget_amount) as budget, sum(transactions.amount) as amount_spent, sum(transactions.tax_amount) as sales_tax, YEAR(budgets.start_date) as year FROM transactions, categories, budgets, transaction_types WHERE categories.id = transactions.categories_id AND categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND transaction_types.name = 'Expense' AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date) GROUP BY year, name ORDER BY year DESC, categories.name")
	@yearly_income = ActiveRecord::Base.connection.select_all("SELECT categories.name, sum(budgets.budget_amount) as budget, sum(transactions.amount) as amount_spent, YEAR(budgets.start_date) as year FROM transactions, categories, budgets, transaction_types WHERE categories.id = transactions.categories_id AND categories.id = budgets.categories_id AND budgets.transaction_types_id = transaction_types.id AND transaction_types.name = 'Deposit' AND YEAR(budgets.start_date) = YEAR(transactions.date) AND MONTH(budgets.start_date) = MONTH(transactions.date) GROUP BY year, name ORDER BY year DESC, categories.name")
	@months = 'January','February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
	@m_budget_total = 0 
	@m_amount_total = 0 
	@y_amount_total = 0
	@y_sales_tax = 0
	@year 
  end
  
end

