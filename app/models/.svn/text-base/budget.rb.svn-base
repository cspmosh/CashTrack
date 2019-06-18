class Budget < ActiveRecord::Base
	belongs_to :category, :foreign_key => "categories_id" 
	belongs_to :transaction_type, :foreign_key => "transaction_types_id"
	belongs_to :frequency_type, :foreign_key => "frequency_types_id"
	validates_numericality_of :budget_amount
	validates_presence_of :budget_amount, :categories_id, :transaction_types_id, :start_date
	validates_uniqueness_of :categories_id, :scope => :start_date, :message => "must be unique for a given month. This category is already assigned a budget for the selected month."
	
	#method to copy reoccuring budgets
	def self.copy_budgets		
		@current_budgets = self.find(:all, :conditions => ["MONTH(start_date) = ? AND YEAR(start_date) = ?", Date.today.month, Date.today.year])
		if @current_budgets.empty?
			#get reoccuring budgets from last month 
			@reoccurring_budgets = self.find(:all, :conditions => ["(MONTH(start_date) = ? AND YEAR(start_date) = ? AND frequency_types_id <> 3)", 1.month.ago.month, 1.month.ago.year])			
			#make a duplicate of each of the reoccuring budgets and save them off with the current date
			if !@reoccurring_budgets.empty?
				for budget in @reoccurring_budgets
					new_budget = self.new
					new_budget.categories_id = budget.categories_id
					new_budget.budget_amount = budget.budget_amount
					new_budget.frequency_types_id = budget.frequency_types_id
					new_budget.transaction_types_id = budget.transaction_types_id
					new_budget.start_date = Date.new(y=Date.today.year.to_i, m=Date.today.month.to_i, d=1)
					new_budget.save
				end
			end
		end
	end
	
end
