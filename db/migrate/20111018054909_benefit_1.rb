class Benefit1 < ActiveRecord::Migration
  def up
    remove_column :benefits,:ref_benefit_category_id
    add_column :benefits,:benefit_category_id,:integer
  end

  def down
  end
end
