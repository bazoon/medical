class CreateRefHospitalizationTypes < ActiveRecord::Migration
  def change
    create_table :ref_hospitalization_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
