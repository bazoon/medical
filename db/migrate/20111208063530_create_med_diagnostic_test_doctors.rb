class CreateMedDiagnosticTestDoctors < ActiveRecord::Migration
  def change
    
    create_table :med_diagnostic_test_doctors do |t|
      t.integer :doctor_type_id
      t.integer :med_diagnostic_test_id

      t.timestamps
    end
  end
end
