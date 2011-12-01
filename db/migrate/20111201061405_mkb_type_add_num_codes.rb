class MkbTypeAddNumCodes < ActiveRecord::Migration
  def up
   add_column :ref_mkb_types,:code_i,:integer
  end

  def down

  end


end
