class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
	  t.references :categories, :null => false	
      t.decimal :budget_amount, :precision => 8, :scale => 2, :default => 0
	  t.string :frequency, :limit => 16, :default => "Monthly", :null => false
	  t.references :transaction_types, :null => false
  	  t.date :start_date, :null => false, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
