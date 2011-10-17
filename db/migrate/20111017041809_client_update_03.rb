class ClientUpdate03 < ActiveRecord::Migration
  def up
    remove_column :clients,:address
    add_column :clients,:real_address,:string
    add_column :clients,:reg_address,:string
  end

  def down
  end
end
