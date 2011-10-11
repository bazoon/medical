class HtmHelpNote < ActiveRecord::Base
  belongs_to :client
  belongs_to :htm_help_type, :class_name => 'Ref::HtmHelpType'

  validates :actual_date,:htm_help_type_id,:presence => true

end
