class CreateRefDoctorTypes < ActiveRecord::Migration
  def change
    create_table :ref_doctor_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
