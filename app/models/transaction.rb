class Transaction < ActiveRecord::Base
	belongs_to :category, :foreign_key => "categories_id"
	belongs_to :account, :foreign_key => "accounts_id"
	belongs_to :transaction_type, :foreign_key => "transaction_types_id"
	validates_numericality_of :amount
	validates_numericality_of :tax_amount
	validates_presence_of :description, :amount, :transaction_type, :date
end
