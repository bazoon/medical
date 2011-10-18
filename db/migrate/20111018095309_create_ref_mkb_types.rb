class CreateRefMkbTypes < ActiveRecord::Migration
  def change
    create_table :ref_mkb_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
