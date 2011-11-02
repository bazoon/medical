class Mse1 < ActiveRecord::Migration
  def up
   # remove_column :mses,:first_one
   # remove_column :mses,:first_second
   # remove_column :mses,:first_third
   # remove_column :mses,:re_third_to_one
   # remove_column :mses,:re_third_to_second
   # remove_column :mses,:re_second_to_one

    add_column :mses,:first,:integer
    add_column :mses,:re,:integer

  end

  def down
  end
end
