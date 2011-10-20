class CreateRefLabClinMins < ActiveRecord::Migration
  def change
    create_table :ref_lab_clin_mins do |t|
      t.integer :lab_test_type_id

      t.timestamps
    end
  end
end
