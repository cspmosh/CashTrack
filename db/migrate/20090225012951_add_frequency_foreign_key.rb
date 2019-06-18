class AddFrequencyForeignKey < ActiveRecord::Migration
  def self.up
	change_table :budgets do |t|
		t.references :frequency_types, :null => false, :default => 1
	end
	execute "update budgets set frequency_types_id = 2 where frequency = 'Annually';"
	remove_column(:budgets, :frequency)
  end

  def self.down
	add_column :budgets, :frequency, :string, :default => "Monthly", :null => false, :limit => 16
	remove_column(:budgets, :frequency_types_id)
  end
end
