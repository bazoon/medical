class Mkb1 < ActiveRecord::Migration
  def up
    add_column :mkbs,:user_id,:integer
  end

  def down
  end
end
