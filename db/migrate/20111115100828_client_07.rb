class Client07 < ActiveRecord::Migration
  def up
    add_column :clients,:is_uov,:boolean
    add_column :clients,:is_ivov,:boolean
    add_column :clients,:is_ubd,:boolean
  end

  def down
  end
end
