class DiagnosticTest1 < ActiveRecord::Migration
  def up
    add_column :diagnostic_tests,:total,:integer
  end

  def down
  end
end
