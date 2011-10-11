class CreateRefLabTestTypes < ActiveRecord::Migration
  def change
    create_table :ref_lab_test_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
