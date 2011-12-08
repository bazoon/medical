class MedDiagnosticTestAddHospType < ActiveRecord::Migration
  def up
    remove_column :med_diagnostic_tests,:med_diagnostic_test_type_id
    add_column :med_diagnostic_tests,:hospitalization_type_id,:integer
  end

  def down
  end
end
