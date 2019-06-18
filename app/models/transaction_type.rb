class TransactionType < ActiveRecord::Base
	has_many :transactions
	has_many :budgets
end
