class Disp01 < ActiveRecord::Migration
  def up
    add_column :disps,:client_id,:integer
    add_column :disps,:user_id,:integer
  end

  def down
  end
end
