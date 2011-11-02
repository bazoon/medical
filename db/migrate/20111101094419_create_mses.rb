class CreateMses < ActiveRecord::Migration
  def change
    create_table :mses do |t|
      t.integer :user_id
      t.integer :mkb_type_id
      t.date :send_date
      t.boolean :ipr

  #    t.boolean :first_one
  #    t.boolean :first_second
  #    t.boolean :first_third

  #    t.boolean :re_third_to_second
  #    t.boolean :re_third_to_one
  #    t.boolean :re_second_to_one

      t.integer :conclusion_group
      t.integer :conclusion_till
      t.date :conclusion_date

      t.boolean :indefinitely

      t.timestamps
    end
  end
end
