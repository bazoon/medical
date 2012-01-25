class CreateRefLabTestTypeGroups < ActiveRecord::Migration
  def change
    create_table :ref_lab_test_type_groups do |t|
      t.integer :lab_test_type_id
      t.integer :lab_test_group_id

      t.timestamps
    end
  end
end
