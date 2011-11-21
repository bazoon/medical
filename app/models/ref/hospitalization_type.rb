class Ref::HospitalizationType < ActiveRecord::Base
 has_many :hospitalizations
 validates :name, :presence => true

def can_be_deleted
  hospitalizations.count<=0
end               
  
end
