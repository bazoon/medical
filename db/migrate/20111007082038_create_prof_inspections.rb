class CreateProfInspections < ActiveRecord::Migration
  def change
    create_table :prof_inspections do |t|
      t.integer :client_id
      t.date :actual_date
      t.integer :user_id
      t.text :conclusion

      t.timestamps
    end
  end
end
