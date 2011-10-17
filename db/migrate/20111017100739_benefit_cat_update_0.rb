class BenefitCatUpdate0 < ActiveRecord::Migration
  def up
    remove_column :ref_benefit_categories,:source
    add_column :ref_benefit_categories,:source,:integer
  end

  def down
  end
end
