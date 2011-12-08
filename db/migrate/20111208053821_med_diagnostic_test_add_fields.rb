class MedDiagnosticTestAddFields < ActiveRecord::Migration
  def up
    add_column :med_diagnostic_tests,:aim,:integer
  end

  def down
  end
end
