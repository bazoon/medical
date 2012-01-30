class MkbAddEndDateGroup < ActiveRecord::Migration
  def up
    add_column :mkbs,:detach_date,:date
    add_column :mkbs,:disp_group,:integer
  end

  def down
  end
end
