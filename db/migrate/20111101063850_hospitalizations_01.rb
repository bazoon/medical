class Hospitalizations01 < ActiveRecord::Migration
  def up
    add_column :hospitalizations,:mkb_type_id,:integer
  end

  def down
  end
end
