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

ActiveRecord::Schema.define(:version => 20120211023544) do

  create_table "courses", :force => true do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "course_number"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "educational_resources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "payment_status"
    t.boolean  "approved"
    t.boolean  "teaching_assistant"
    t.float    "registration_fee"
    t.integer  "user_id"
    t.integer  "section_id"
    t.integer  "study_group_id"
    t.boolean  "class_coordinator"
    t.boolean  "study_group_leader"
    t.integer  "signup_reason_id"
    t.integer  "scholarship_code_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "resource_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "department_id"
  end

  create_table "scholarship_codes", :force => true do |t|
    t.integer  "department_id"
    t.string   "code"
    t.integer  "discount_type"
    t.float    "discount_amount"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "course_id"
    t.string   "name"
    t.text     "description"
    t.integer  "registration_status"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "registration_fee"
    t.integer  "class_length"
    t.integer  "max_students"
    t.integer  "study_group_size_for_official_status"
    t.integer  "max_study_group_size"
    t.text     "registration_message"
    t.boolean  "show_message"
    t.integer  "resource_list_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "signup_reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "study_groups", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.boolean  "official"
    t.string   "website"
    t.integer  "leader_id"
    t.string   "meeting_day"
    t.integer  "max_students"
    t.integer  "educational_resource_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "users", :force => true do |t|
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
