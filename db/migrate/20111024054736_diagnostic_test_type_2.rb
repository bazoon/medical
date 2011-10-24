class DiagnosticTestType2 < ActiveRecord::Migration
  def up
    add_column :ref_diagnostic_test_types,:valid_period,:integer 
  end

  def down
  end
end
