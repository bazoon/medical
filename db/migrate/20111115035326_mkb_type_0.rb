class MkbType0 < ActiveRecord::Migration
  def up
    add_column :ref_mkb_types,:class_number,:string
  end

  def down
  end
end
