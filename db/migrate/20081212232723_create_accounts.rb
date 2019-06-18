class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :number, :limit => 64
      t.string :name, :limit => 64
      t.string :account_type, :limit => 16
      t.decimal :balance, :precision => 8, :scale => 2, :default => 0, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end