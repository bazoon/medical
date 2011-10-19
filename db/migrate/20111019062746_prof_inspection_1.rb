class ProfInspection1 < ActiveRecord::Migration
  def up
    add_column :prof_inspections,:mkb_type_id,:integer
    add_column :prof_inspections,:stat_card,:boolean,:default => false
    add_column :prof_inspections,:first_detected,:boolean,:default => false
  end

  def down
  end
end
