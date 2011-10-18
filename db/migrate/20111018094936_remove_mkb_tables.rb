class RemoveMkbTables < ActiveRecord::Migration
  def up
    drop_table :mkbs
    drop_table :ref_mkbs
  end

  def down
  end
end
