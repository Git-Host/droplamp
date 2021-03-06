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

ActiveRecord::Schema.define(:version => 20120625173349) do

  create_table "assets", :force => true do |t|
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buckets", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :force => true do |t|
    t.string   "domain"
    t.string   "tld"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "site_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layout_revision"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month"
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "refferals", :force => true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refferals", ["from_user_id"], :name => "index_refferals_on_from_user_id"
  add_index "refferals", ["to_user_id"], :name => "index_refferals_on_to_user_id"

  create_table "sites", :force => true do |t|
    t.integer  "owner_id"
    t.string   "dropbox_folder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "site_id"
    t.string   "stripe_customer_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plan_id"
  end

  add_index "subscriptions", ["site_id"], :name => "index_subscriptions_on_site_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "dropbox_token"
    t.string   "dropbox_token_secret"
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "delta_cursor"
    t.string   "stripe_customer_id"
    t.integer  "reffered_by_id"
    t.integer  "balance",                :default => 0
    t.boolean  "stored_stripe_card",     :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
