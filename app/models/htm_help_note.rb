class HtmHelpNote < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :htm_help_type, :class_name => 'Ref::HtmHelpType'

  validates :actual_date,:htm_help_type_id,:presence => true

end
# == Schema Information
#
# Table name: htm_help_notes
#
#  id               :integer         not null, primary key
#  actual_date      :date
#  htm_help_type_id :integer
#  note             :text
#  client_id        :integer
#  created_at       :datetime
#  updated_at       :datetime
#

