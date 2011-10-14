class UserPasswordDigest < ActiveRecord::Migration
  def up
    add_column :users,:password_digest,:string
  end

  def down
  end
end
