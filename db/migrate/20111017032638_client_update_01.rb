class ClientUpdate01 < ActiveRecord::Migration
  def up
    remove_column :clients,:benefit_id
    remove_column :clients,:veteran_id
    remove_column :clients,:mse_note
    remove_column :clients,:indiv_reab_programm
    remove_column :clients,:decease_mkb_10
    remove_column :clients,:dlo
    remove_column :clients,:phones

    add_column :clients,:mobile_phone,:string
    add_column :clients,:home_phone,:string
    add_column :clients,:work_phone,:string
    add_column :clients,:relative_phone,:string

    add_column :clients,:pensioner,:boolean,:default => false
    add_column :clients,:blood_group,:integer
    add_column :clients,:benefit_refuse,:boolean,:default => false
    add_column :clients,:drug_intolerance,:text
  end

  def down
  end
end
