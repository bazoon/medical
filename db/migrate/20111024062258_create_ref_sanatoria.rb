class CreateRefSanatoria < ActiveRecord::Migration
  def change
    create_table :ref_sanatoria do |t|
      t.string :name

      t.timestamps
    end
  end
end
