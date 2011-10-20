class Ref::LabClinMin < ActiveRecord::Base
 belongs_to :lab_test_type

def can_be_deleted
  true
end  


end
