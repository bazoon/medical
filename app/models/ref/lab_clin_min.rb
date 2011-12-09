class Ref::LabClinMin < ActiveRecord::Base
 belongs_to :lab_test_type

def can_be_deleted
  true
end  


end
# == Schema Information
#
# Table name: ref_lab_clin_mins
#
#  id               :integer         not null, primary key
#  lab_test_type_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

