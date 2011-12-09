class Ref::Sanatorium < ActiveRecord::Base
 validates :name,:presence => true

def can_be_deleted
 true  
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

