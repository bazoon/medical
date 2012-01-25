class Ref::LabTestGroup < ActiveRecord::Base
  has_many :lab_test_types, :through => :lab_test_type_groups
end
