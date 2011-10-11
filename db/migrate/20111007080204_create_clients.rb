class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    t.string   "num_card"
    t.string   "name"
    t.string   "surname"
    t.string   "father_name"
    t.date     "birth_date"
    t.string   "pasp_num"
    t.string   "pasp_seria"
    t.string   "address"
    t.string   "snils"
    t.string   "work_place"
    t.string   "work_position"
    t.string   "benefit_id"
    t.string   "veteran_id"
    t.string   "indiv_reab_programm"
    t.string   "mse_note"
    t.date     "attach_date"
    t.string   "dlo"
    t.string   "decease_mkb_10"
    t.string   "special_note"
    t.date     "detach_date"
    t.string   "notes"
    t.integer  "ins_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_sex_id"
    t.text     "phones"
    t.timestamps
    end
  end
end
