class CreateTransactionTypes < ActiveRecord::Migration
  def self.up
    create_table :transaction_types do |t|
	  t.string :name, :limit => 16
    end
    new_transaction_type = TransactionType.new
	new_transaction_type.name = "Expense"
	new_transaction_type.save
	new_transaction_type = TransactionType.new
	new_transaction_type.name = "Deposit"
	new_transaction_type.save
  end

  def self.down
    drop_table :transaction_types
  end
end