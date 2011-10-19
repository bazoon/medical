class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.integer :prof_inspection_id
      t.integer :mkb_type_id
      t.boolean :first_detected,:default => false

      t.timestamps
    end
  end
end
