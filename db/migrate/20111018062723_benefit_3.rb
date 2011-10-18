class Benefit3 < ActiveRecord::Migration
  def up
    add_column :benefits,:primary,:boolean,:default => false
  end

  def down
  end
end
