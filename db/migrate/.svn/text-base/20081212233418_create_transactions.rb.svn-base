class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
	  t.string :description, :limit => 256, :null => false
	  t.decimal :amount, :precision => 8, :scale => 2, :default => 0, :null => false
	  t.references :categories
	  t.string :number, :limit => 16
	  t.references :transaction_types
	  t.references :accounts
	  t.date :date
	  t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end