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

ActiveRecord::Schema.define(:version => 20111019074829) do

  create_table "benefits", :force => true do |t|
    t.integer  "client_id"
    t.string   "doc_name"
    t.string   "doc_seria"
    t.string   "doc_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "doc_date"
    t.integer  "benefit_category_id"
    t.string   "doc_given_by"
    t.boolean  "prim"
  end

  create_table "client_sexes", :force => true do |t|
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "num_card"
    t.string   "name"
    t.string   "surname"
    t.string   "father_name"
    t.date     "birth_date"
    t.string   "pasp_num"
    t.string   "pasp_seria"
    t.string   "snils"
    t.string   "work_place"
    t.string   "work_position"
    t.date     "attach_date"
    t.string   "special_note"
    t.date     "detach_date"
    t.string   "notes"
    t.integer  "ins_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_sex_id"
    t.integer  "lab_tests_count",            :default => 0
    t.integer  "diagnostic_tests_count",     :default => 0
    t.integer  "htm_help_notes_count",       :default => 0
    t.integer  "med_diagnostic_tests_count", :default => 0
    t.integer  "hospitalizations_count",     :default => 0
    t.integer  "prof_inspections_count",     :default => 0
    t.integer  "sanatorium_notes_count",     :default => 0
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "relative_phone"
    t.boolean  "pensioner",                  :default => false
    t.integer  "blood_group"
    t.boolean  "benefit_refuse",             :default => false
    t.text     "drug_intolerance"
    t.string   "ins_seria"
    t.string   "ins_num"
    t.string   "real_address"
    t.string   "reg_address"
    t.integer  "benefits_count",             :default => 0
    t.integer  "mkbs_count",                 :default => 0
  end

  add_index "clients", ["id"], :name => "clients_id_idx"

  create_table "diagnoses", :force => true do |t|
    t.integer  "prof_inspection_id"
    t.integer  "mkb_type_id"
    t.boolean  "first_detected",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagnostic_tests", :force => true do |t|
    t.date     "test_date"
    t.integer  "diagnostic_test_type_id"
    t.integer  "client_id"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitalizations", :force => true do |t|
    t.date     "actual_date"
    t.integer  "client_id"
    t.integer  "hospitalization_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "htm_help_notes", :force => true do |t|
    t.date     "actual_date"
    t.integer  "htm_help_type_id"
    t.text     "note"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lab_tests", :force => true do |t|
    t.date     "test_date"
    t.integer  "client_id"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lab_test_type_id"
  end

  create_table "med_diagnostic_tests", :force => true do |t|
    t.date     "test_date"
    t.integer  "med_diagnostic_test_type_id"
    t.integer  "client_id"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mkbs", :force => true do |t|
    t.integer  "client_id"
    t.integer  "mkb_type_id"
    t.date     "actual_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "prof_inspections", :force => true do |t|
    t.integer  "client_id"
    t.date     "actual_date"
    t.integer  "user_id"
    t.text     "conclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mkb_type_id"
    t.boolean  "stat_card",      :default => false
    t.boolean  "first_detected", :default => false
  end

  create_table "ref_benefit_categories", :force => true do |t|
    t.string   "code"
    t.string   "short_name"
    t.string   "full_name"
    t.integer  "percent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source"
  end

  create_table "ref_desease_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_diagnostic_test_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_doctor_deseases", :force => true do |t|
    t.integer  "doctor_type_id"
    t.integer  "desease_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_doctor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_hospitalization_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_htm_help_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_ins_companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_lab_test_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_med_diagnostic_test_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ref_mkb_types", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sanatorium_notes", :force => true do |t|
    t.integer  "client_id"
    t.date     "actual_date"
    t.text     "neediness_reference"
    t.text     "sanatorium_card"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "doctor_type_id"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.string   "father_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pass"
    t.string   "password_digest"
  end

end
