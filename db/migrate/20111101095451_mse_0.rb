class Mse0 < ActiveRecord::Migration
  def up
    add_column :mses,:client_id,:integer
  end

  def down
  end
end
