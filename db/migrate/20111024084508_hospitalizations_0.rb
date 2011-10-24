class Hospitalizations0 < ActiveRecord::Migration
  def up
   remove_column :hospitalizations,:actual_date
   add_column :hospitalizations,:kind,:integer,:default => 0
   add_column :hospitalizations,:period_start,:date
   add_column :hospitalizations,:period_end,:date


  end

  def down
  end
end
