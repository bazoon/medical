class ClientAddIsWorkVeteran < ActiveRecord::Migration
  def up
    add_column :clients,:is_work_veteran,:boolean,:default => false
  end

  def down
  end
end
