class DispAddMkbId < ActiveRecord::Migration
  def up
    add_column :disps,:mkb_id,:integer
  end

  def down
  end
end
