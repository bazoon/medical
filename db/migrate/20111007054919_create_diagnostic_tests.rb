class CreateDiagnosticTests < ActiveRecord::Migration
  def change
    create_table :diagnostic_tests do |t|
      t.date :test_date
      t.integer :diagnostic_test_type_id
      t.integer :client_id
      t.text :result

      t.timestamps
    end
  end
end
