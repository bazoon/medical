class CreateRefMkbs < ActiveRecord::Migration
  def change
    create_table :ref_mkbs do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
