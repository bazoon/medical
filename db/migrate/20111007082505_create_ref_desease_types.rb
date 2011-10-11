class CreateRefDeseaseTypes < ActiveRecord::Migration
  def change
    create_table :ref_desease_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
