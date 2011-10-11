class ChangeLabTestTypeCol < ActiveRecord::Migration
  def up
    remove_column :lab_tests,:ref_lab_test_type_id
    add_column :lab_tests,:lab_test_type_id,:integer
  end

  def down
  end
end
