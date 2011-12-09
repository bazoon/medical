class Ref::HospitalizationType < ActiveRecord::Base
 has_many :hospitalizations
 validates :name, :presence => true

def can_be_deleted
  hospitalizations.count<=0
end               
  
end
# == Schema Information
#
# Table name: ref_hospitalization_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

