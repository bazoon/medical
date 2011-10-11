class CreateLabTests < ActiveRecord::Migration
  def change
    create_table :lab_tests do |t|
      t.date :test_date
      t.integer :ref_lab_test_type_id
      t.integer :client_id
      t.text :result

      t.timestamps
    end
  end
end
