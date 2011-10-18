class Benefit2 < ActiveRecord::Migration
  def up
    remove_column :benefits,:dog_given_by
    add_column :benefits,:doc_given_by,:string
  end

  def down
  end
end
