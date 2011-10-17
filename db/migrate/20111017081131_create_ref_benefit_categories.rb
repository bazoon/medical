class CreateRefBenefitCategories < ActiveRecord::Migration
  def change
    create_table :ref_benefit_categories do |t|
      t.string :code
      t.string :short_name
      t.string :full_name
      t.integer :percent
      t.string :source

      t.timestamps
    end
  end
end
