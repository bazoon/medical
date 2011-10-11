class CreateClientSexes < ActiveRecord::Migration
  def change
    create_table :client_sexes do |t|
      t.string :sex

      t.timestamps
    end
  end
end
