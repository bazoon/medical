class ProfInspectionRemoveFirstDetected < ActiveRecord::Migration
  def up
    remove_column :prof_inspections,:first_detected
  end

  def down
  end
end
