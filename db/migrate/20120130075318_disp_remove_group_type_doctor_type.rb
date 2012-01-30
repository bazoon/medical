class DispRemoveGroupTypeDoctorType < ActiveRecord::Migration
  def up
    remove_column :disps,:disp_group
    remove_column :disps,:doctor_type_id
    remove_column :disps,:disp_type
  end

  def down
  end
end
