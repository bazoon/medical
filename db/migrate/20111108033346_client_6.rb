class Client6 < ActiveRecord::Migration
  def up
    add_column :clients,:detach_reason,:integer,:default => 0
    add_column :clients,:death_date,:date
    add_column :clients,:death_reason_id,:integer
  end

  def down
  end
end
