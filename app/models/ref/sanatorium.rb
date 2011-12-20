class Ref::Sanatorium < ActiveRecord::Base
 validates :name,:presence => true
 has_many :sanatorium_notes

def can_be_deleted
 sanatorium_notes.count == 0
end

end
# == Schema Information
#
# Table name: ref_sanatoria
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

