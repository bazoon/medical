class ClientAddOtherCounts < ActiveRecord::Migration
  def up
        
    add_column :clients,:diagnostic_tests_count,:integer,:default => 0
    add_column :clients,:htm_help_notes_count,:integer,:default => 0
    add_column :clients,:med_diagnostic_tests_count,:integer,:default => 0
    add_column :clients,:hospitalizations_count,:integer,:default => 0
    add_column :clients,:prof_inspections_count,:integer,:default => 0
    add_column :clients,:sanatorium_notes_count,:integer,:default => 0

    Client.all.each do |c|
      c.update_attribute :hospitalizations_count,c.hospitalizations.length
      c.update_attribute :diagnostic_tests_count,c.diagnostic_tests.length
      c.update_attribute :med_diagnostic_tests_count,c.med_diagnostic_tests.length
      c.update_attribute :htm_help_notes_count,c.htm_help_notes.length
      c.update_attribute :prof_inspections_count,c.prof_inspections.length
      c.update_attribute :sanatorium_notes_count,c.sanatorium_notes.length
    end


  end

  def down
  end
end
