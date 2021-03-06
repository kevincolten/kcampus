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

ActiveRecord::Schema.define(:version => 20130919043339) do

  create_table "admins", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "idn"
    t.string   "location_id"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "client_id",   :null => false
  end

  add_index "admins", ["client_id"], :name => "index_admins_on_client_id"
  add_index "admins", ["email"], :name => "index_admins_on_email"
  add_index "admins", ["location_id"], :name => "index_admins_on_location_id"

  create_table "attendance_records", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "client_id"
    t.float    "hours"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attendance_records", ["client_id"], :name => "index_attendance_records_on_client_id"
  add_index "attendance_records", ["course_id"], :name => "index_attendance_records_on_course_id"
  add_index "attendance_records", ["student_id"], :name => "index_attendance_records_on_student_id"

  create_table "clients", :force => true do |t|
    t.string   "fname",        :null => false
    t.string   "lname",        :null => false
    t.string   "organization", :null => false
    t.string   "email",        :null => false
    t.string   "phone",        :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "course_regs", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id",    :null => false
  end

  add_index "course_regs", ["client_id"], :name => "index_course_regs_on_client_id"
  add_index "course_regs", ["course_id"], :name => "index_course_regs_on_course_id"
  add_index "course_regs", ["student_id"], :name => "index_course_regs_on_student_id"

  create_table "course_types", :force => true do |t|
    t.string   "long_name",  :null => false
    t.string   "short_name", :null => false
    t.string   "discipline", :null => false
    t.integer  "level",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id",  :null => false
  end

  add_index "course_types", ["client_id"], :name => "index_course_types_on_client_id"

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
    t.integer  "max_seats",                         :null => false
    t.integer  "section",                           :null => false
    t.integer  "synonym"
    t.integer  "budget_code",                       :null => false
    t.time     "start_time",                        :null => false
    t.time     "end_time",                          :null => false
    t.integer  "number",                            :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "min_seats",                         :null => false
    t.integer  "client_id",                         :null => false
  end

  add_index "courses", ["client_id"], :name => "index_courses_on_client_id"
  add_index "courses", ["course_type_id"], :name => "index_courses_on_course_type_id"
  add_index "courses", ["instructor_id"], :name => "index_courses_on_instructor_id"
  add_index "courses", ["location_id"], :name => "index_courses_on_location_id"
  add_index "courses", ["term_id"], :name => "index_courses_on_term_id"

  create_table "event_regs", :force => true do |t|
    t.integer  "event_id"
    t.integer  "client_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "fname",                         :null => false
    t.string   "lname",                         :null => false
    t.date     "dob",                           :null => false
    t.integer  "idn"
    t.boolean  "attended",   :default => false
  end

  add_index "event_regs", ["client_id"], :name => "index_event_regs_on_client_id"
  add_index "event_regs", ["event_id"], :name => "index_event_regs_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "date"
    t.integer  "max_seats"
    t.integer  "location_id"
    t.time     "start_time"
    t.integer  "client_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.time     "end_time",      :null => false
    t.string   "contact_name",  :null => false
    t.string   "contact_email", :null => false
    t.string   "contact_phone", :null => false
    t.string   "room",          :null => false
    t.integer  "term_id",       :null => false
  end

  add_index "events", ["client_id"], :name => "index_events_on_client_id"
  add_index "events", ["location_id"], :name => "index_events_on_location_id"
  add_index "events", ["term_id"], :name => "index_events_on_term_id"

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
    t.integer  "client_id",   :null => false
  end

  add_index "instructors", ["client_id"], :name => "index_instructors_on_client_id"
  add_index "instructors", ["location_id"], :name => "index_instructors_on_location_id"

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
    t.integer  "client_id",     :null => false
  end

  add_index "locations", ["client_id"], :name => "index_locations_on_client_id"

  create_table "students", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.date     "dob"
    t.integer  "idn"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id",  :null => false
    t.string   "email"
    t.string   "phone"
  end

  add_index "students", ["client_id"], :name => "index_students_on_client_id"

  create_table "terms", :force => true do |t|
    t.integer  "year",         :null => false
    t.string   "semester",     :null => false
    t.integer  "number",       :null => false
    t.date     "start_date",   :null => false
    t.date     "end_date",     :null => false
    t.date     "reg_start",    :null => false
    t.date     "reg_end",      :null => false
    t.date     "add_drop_end", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "code",         :null => false
    t.integer  "client_id",    :null => false
  end

  add_index "terms", ["client_id"], :name => "index_terms_on_client_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                     :null => false
    t.string   "password_digest",                           :null => false
    t.string   "session_token",                             :null => false
    t.boolean  "client",                 :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "client_id",                                 :null => false
    t.boolean  "admin",                  :default => false
    t.boolean  "instructor",             :default => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["client_id"], :name => "index_users_on_client_id"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
