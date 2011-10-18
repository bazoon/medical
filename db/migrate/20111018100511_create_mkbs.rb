class CreateMkbs < ActiveRecord::Migration
  def change
    create_table :mkbs do |t|
      t.integer :client_id
      t.integer :mkb_type_id
      t.date :actual_date

      t.timestamps
    end
  end
end
