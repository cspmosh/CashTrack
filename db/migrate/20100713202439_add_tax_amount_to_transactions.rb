class AddTaxAmountToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :tax_amount, :decimal, :precision => 8, :scale =>2, :default => 0
  end

  def self.down
    remove_column :transactions, :tax_amount
  end
end
