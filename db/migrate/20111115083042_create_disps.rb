class CreateDisps < ActiveRecord::Migration
  def change
    create_table :disps do |t|
      t.date :actual_date
      t.integer :disp_type 
      t.integer :mkb_type_id 
      t.integer :doctor_type_id 
      t.integer :result 
      t.integer :disp_group 

      t.timestamps
    end
  end
end
