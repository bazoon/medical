class Benefit4 < ActiveRecord::Migration
  def up
    remove_column :benefits,:primary
    add_column :benefits,:prim,:boolean
  end

  def down
  end
end
