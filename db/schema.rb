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

ActiveRecord::Schema.define(:version => 20140310021016) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "real_name"
    t.string   "title"
    t.boolean  "active"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "playwrights", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.boolean  "local"
    t.boolean  "relationship"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "representation"
    t.text     "agent_contact"
    t.text     "contact"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "script_id"
    t.string   "link"
    t.integer  "reader_id"
    t.string   "recommendation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "scripts", :force => true do |t|
    t.string   "title"
    t.string   "year"
    t.integer  "playwright_id"
    t.integer  "males"
    t.integer  "females"
    t.integer  "other"
    t.string   "link"
    t.string   "sent_to"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "requested_by"
    t.string   "sent_by"
    t.string   "rights_holder"
    t.boolean  "must_read"
    t.string   "script_file_name"
    t.string   "script_content_type"
    t.integer  "script_file_size"
    t.datetime "script_updated_at"
  end

end
