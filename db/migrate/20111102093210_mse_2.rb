class Mse2 < ActiveRecord::Migration
  def up
    add_column :mses,:consultation,:boolean,:default => false
  end

  def down
  end
end
