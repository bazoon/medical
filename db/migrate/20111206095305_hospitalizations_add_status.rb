class HospitalizationsAddStatus < ActiveRecord::Migration
  def up
    add_column :hospitalizations, :status, :integer
  end

  def down
  end
end
