class HospitalizationsChangeKind < ActiveRecord::Migration
  def up
    remove_column :hospitalizations,:kind
    remove_column :hospitalizations,:status

    add_column :hospitalizations,:kind,:integer
    add_column :hospitalizations,:status,:integer,:default => 0
  end

  def down
  end
end
