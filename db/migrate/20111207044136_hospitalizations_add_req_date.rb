class HospitalizationsAddReqDate < ActiveRecord::Migration
  def up
    add_column :hospitalizations,:request_date,:date
  end

  def down
  end
end
