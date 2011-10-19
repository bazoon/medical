class DropProfInspectionDiagnoses < ActiveRecord::Migration
  def up
    drop_table :prof_inspection_diagnoses
  end

  def down
  end
end
