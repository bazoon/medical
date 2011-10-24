class LabTestType1 < ActiveRecord::Migration
  def up
    add_column :ref_lab_test_types,:norm,:string
  end

  def down
  end
end
