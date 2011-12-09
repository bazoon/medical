class SanatoriumNote < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :sanatorium, :class_name => 'Ref::Sanatorium'
  


end
# == Schema Information
#
# Table name: sanatorium_notes
#
#  id                        :integer         not null, primary key
#  client_id                 :integer
#  created_at                :datetime
#  updated_at                :datetime
#  neediness_ref_date        :date
#  sanatorium_card_fill_date :date
#  period_start              :date
#  period_end                :date
#  sanatorium_id             :integer
#

