class CreateHtmHelpNotes < ActiveRecord::Migration
  def change
    create_table :htm_help_notes do |t|
      t.date :actual_date
      t.integer :htm_help_type_id
      t.text :note
      t.integer :client_id

      t.timestamps
    end
  end
end
