class SanatoriumNotes0 < ActiveRecord::Migration
  def up
    remove_column :sanatorium_notes,:actual_date
    remove_column :sanatorium_notes,:neediness_reference
    remove_column :sanatorium_notes,:sanatorium_card

    add_column :sanatorium_notes,:neediness_ref_date,:date
    add_column :sanatorium_notes,:sanatorium_card_fill_date ,:date
    add_column :sanatorium_notes,:period_start,:date
    add_column :sanatorium_notes,:period_end,:date
    add_column :sanatorium_notes,:sanatorium_id,:integer
    
  end

  def down
  end
end
