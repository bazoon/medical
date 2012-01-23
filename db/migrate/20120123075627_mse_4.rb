class Mse4 < ActiveRecord::Migration
  def up
    remove_column :mses,:conclusion_till
    add_column :mses,:conclusion_till,:date
  end

  def down
  end
end
