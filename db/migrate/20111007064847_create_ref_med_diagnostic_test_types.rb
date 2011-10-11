class CreateRefMedDiagnosticTestTypes < ActiveRecord::Migration
  def change
    create_table :ref_med_diagnostic_test_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
