class Mse3 < ActiveRecord::Migration
  def up
    remove_column :mses,:first,:re
    add_column :mses,:reason,:integer
  end

  def down
  end
end
