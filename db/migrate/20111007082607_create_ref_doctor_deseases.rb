class CreateRefDoctorDeseases < ActiveRecord::Migration
  def change
    create_table :ref_doctor_deseases do |t|
      t.integer :doctor_type_id
      t.integer :desease_type_id

      t.timestamps
    end
  end
end
