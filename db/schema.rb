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

ActiveRecord::Schema.define(:version => 20130902224127) do

  create_table "course_types", :force => true do |t|
    t.string   "long_name",  :null => false
    t.string   "short_name", :null => false
    t.string   "discipline", :null => false
    t.integer  "level",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.integer  "term_id",                           :null => false
    t.integer  "course_type_id",                    :null => false
    t.integer  "instructor_id",                     :null => false
    t.integer  "location_id",                       :null => false
    t.boolean  "sunday",         :default => false, :null => false
    t.boolean  "monday",         :default => false, :null => false
    t.boolean  "tuesday",        :default => false, :null => false
    t.boolean  "wednesday",      :default => false, :null => false
    t.boolean  "thursday",       :default => false, :null => false
    t.boolean  "friday",         :default => false, :null => false
    t.boolean  "saturday",       :default => false, :null => false
    t.string   "room_number",                       :null => false
    t.integer  "seats",                             :null => false
    t.integer  "section",                           :null => false
    t.integer  "synonym",                           :null => false
    t.integer  "budget_code",                       :null => false
    t.time     "start_time",                        :null => false
    t.time     "end_time",                          :null => false
    t.integer  "number",                            :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "instructors", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "idn"
    t.integer  "location_id"
    t.string   "phone"
    t.string   "email"
    t.float    "pay_rate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "code",          :null => false
    t.string   "name",          :null => false
    t.string   "address",       :null => false
    t.string   "city",          :null => false
    t.string   "state",         :null => false
    t.string   "zipcode",       :null => false
    t.string   "contact_name",  :null => false
    t.string   "contact_phone", :null => false
    t.string   "contact_email", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.date     "dob"
    t.integer  "idn"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "terms", :force => true do |t|
    t.integer  "year",         :null => false
    t.string   "semester",     :null => false
    t.integer  "number",       :null => false
    t.date     "start",        :null => false
    t.date     "end",          :null => false
    t.date     "reg_start",    :null => false
    t.date     "reg_end",      :null => false
    t.date     "add_drop_end", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.boolean  "admin",           :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
