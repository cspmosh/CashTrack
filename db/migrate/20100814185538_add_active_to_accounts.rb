class AddActiveToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :active, :string, :limit => 1
  end

  def self.down
    remove_column :accounts, :active
  end
end
