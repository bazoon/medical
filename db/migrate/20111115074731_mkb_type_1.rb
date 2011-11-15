class MkbType1 < ActiveRecord::Migration
  def up
    add_column :ref_mkb_types,:doctor_type_id,:integer
  end

  def down
  end
end
