# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140205044650) do

  create_table "members", :force => true do |t|
    t.string   "email"
    t.boolean  "admin",         :default => false
    t.boolean  "deactivated",   :default => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.decimal  "quantity"
    t.integer  "product_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "ordered",          :default => false
    t.boolean  "taken",            :default => false
    t.boolean  "ready_for_pickup", :default => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "member_id"
    t.decimal  "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image"
    t.integer  "source_id"
    t.text     "source_notes"
    t.string   "unit"
    t.decimal  "price"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
