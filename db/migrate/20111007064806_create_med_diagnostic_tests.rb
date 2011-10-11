class CreateMedDiagnosticTests < ActiveRecord::Migration
  def change
    create_table :med_diagnostic_tests do |t|
      t.date :test_date
      t.integer :med_diagnostic_test_type_id
      t.integer :client_id
      t.text :result

      t.timestamps
    end
  end
end
