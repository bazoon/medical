class MkbRenameDetachDate < ActiveRecord::Migration
  def up
    rename_column :mkbs,:detach_date,:out_date
  end

  def down
  end
end
