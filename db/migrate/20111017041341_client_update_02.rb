class ClientUpdate02 < ActiveRecord::Migration
  def up
    add_column :clients,:ins_seria,:string
    add_column :clients,:ins_num,:string
  end

  def down
  end
end
