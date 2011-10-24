class LabTestType0 < ActiveRecord::Migration
  def up
    add_column :ref_lab_test_types,:valid_period,:integer 
  end

  def down
  end
end
