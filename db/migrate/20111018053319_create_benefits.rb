class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.integer :client_id
      t.integer :ref_benefit_category_id
      t.string :doc_name
      t.string :doc_seria
      t.string :doc_num
      t.string :dog_given_by

      t.timestamps
    end
  end
end
