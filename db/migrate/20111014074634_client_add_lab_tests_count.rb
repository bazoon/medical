class ClientAddLabTestsCount < ActiveRecord::Migration
  def up
    add_column :clients,:lab_tests_count,:integer,:default => 0

    Client.all.each do |c|
      c.update_attribute :lab_tests_count,c.lab_tests.length
    end


  end

  def down
  end
end
