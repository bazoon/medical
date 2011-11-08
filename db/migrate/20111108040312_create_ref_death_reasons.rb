class CreateRefDeathReasons < ActiveRecord::Migration
  def change
    create_table :ref_death_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
