# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100814185538) do

  create_table "accounts", :force => true do |t|
    t.string   "number",       :limit => 64
    t.string   "name",         :limit => 64
    t.string   "account_type", :limit => 16
    t.decimal  "balance",                    :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "active",       :limit => 1
  end

  create_table "budgets", :force => true do |t|
    t.integer  "categories_id",                                                       :null => false
    t.decimal  "budget_amount",        :precision => 8, :scale => 2, :default => 0.0
    t.integer  "transaction_types_id",                                                :null => false
    t.date     "start_date",                                                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "frequency_types_id",                                 :default => 1,   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 64, :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frequency_types", :force => true do |t|
    t.string "frequency", :limit => 16
  end

  create_table "transaction_types", :force => true do |t|
    t.string "name", :limit => 16
  end

  create_table "transactions", :force => true do |t|
    t.string   "description",          :limit => 256,                                                :null => false
    t.decimal  "amount",                              :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "categories_id"
    t.string   "number",               :limit => 16
    t.integer  "transaction_types_id"
    t.integer  "accounts_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tax_amount",                          :precision => 8, :scale => 2, :default => 0.0
  end

end