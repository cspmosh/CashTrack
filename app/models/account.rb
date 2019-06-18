class Account < ActiveRecord::Base
	has_many :transactions, :foreign_key => "accounts_id", :dependent => :nullify
	validates_presence_of :name, :balance
	validates_numericality_of :balance
end
