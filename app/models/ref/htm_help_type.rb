class Ref::HtmHelpType < ActiveRecord::Base
 has_many :htm_help_notes
 validates :name, :presence => true

def can_be_deleted
  htm_help_notes.count<=0
end

  
end
