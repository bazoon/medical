class RemoveMkbTables1 < ActiveRecord::Migration
  def up
    drop_table :mkb_types
  end

  def down
  end
end
