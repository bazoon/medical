class ChangeColTypeAtBenefCat < ActiveRecord::Migration
  def up
    remove_column :ref_benefit_categories, :code
    add_column :ref_benefit_categories,:code,:integer
  end

  def down
  end
end
