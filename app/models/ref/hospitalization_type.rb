class Ref::HospitalizationType < ActiveRecord::Base
 has_many :hospitalizations


def can_be_deleted
  hospitalizations.count<=0
end               
  
end
