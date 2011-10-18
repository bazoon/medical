class ClientUpdate04 < ActiveRecord::Migration
  def up
    add_column :clients,:benefits_count,:integer,:default => 0
  end

  def down
  end
end
