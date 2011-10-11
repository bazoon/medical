class CreateRefInsCompanies < ActiveRecord::Migration
  def change
    create_table :ref_ins_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
