class Ref::MedDiagnosticTestType < ActiveRecord::Base
  validates :name,:presence => true
   



def can_be_deleted
  #med_diagnostic_tests.count<=0
end


end
# == Schema Information
#
# Table name: ref_med_diagnostic_test_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

