class Ref::HtmHelpType < ActiveRecord::Base
 has_many :htm_help_notes
 validates :name, :presence => true

def can_be_deleted
  htm_help_notes.count<=0
end

  
end
# == Schema Information
#
# Table name: ref_htm_help_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

