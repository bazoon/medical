class Ref::LabTestTypeGroup < ActiveRecord::Base
  belongs_to :lab_test_type,:class_name => 'Ref::LabTestType'
  belongs_to :lab_test_group,:class_name => 'Ref::LabTestGroup'

end
