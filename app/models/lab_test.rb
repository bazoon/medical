class LabTest < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :lab_test_type, :class_name => 'Ref::LabTestType'

  validates :result,:test_date,:lab_test_type_id,:presence => true
end
