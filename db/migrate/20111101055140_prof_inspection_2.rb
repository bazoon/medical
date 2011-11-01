class ProfInspection2 < ActiveRecord::Migration
  def up
    remove_column :prof_inspections,:stat_card
    add_column :diagnoses,:stat_card,:boolean,:default => false
  end

  def down
  end
end
