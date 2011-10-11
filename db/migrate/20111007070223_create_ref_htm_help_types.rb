class CreateRefHtmHelpTypes < ActiveRecord::Migration
  def change
    create_table :ref_htm_help_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
