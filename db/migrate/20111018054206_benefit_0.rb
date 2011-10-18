class Benefit0 < ActiveRecord::Migration
  def up
    add_column :benefits,:doc_date,:date
  end

  def down
  end
end
