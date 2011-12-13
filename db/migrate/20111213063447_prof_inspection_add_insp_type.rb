class ProfInspectionAddInspType < ActiveRecord::Migration
  def up
    add_column :prof_inspections,:inspection_type,:integer,:default => 0
  end

  def down
  end
end
