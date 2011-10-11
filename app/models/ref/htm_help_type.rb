class Ref::HtmHelpType < ActiveRecord::Base
 has_many :htm_help_notes


def can_be_deleted
  htm_help_notes.count<=0
end

  
end
