class ClientUpdate05 < ActiveRecord::Migration
  def up
    add_column :clients,:disabled,:boolean,:default => false
  end

  def down
  end
end
