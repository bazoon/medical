class ClientUpdate4 < ActiveRecord::Migration
  def up
    add_column :clients,:mkbs_count,:integer,:default => 0
  end

  def down
  end
end
