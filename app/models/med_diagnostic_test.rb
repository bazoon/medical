class MedDiagnosticTest < ActiveRecord::Base
  belongs_to :med_diagnostic_test_type, :class_name => 'Ref::MedDiagnosticTestType'
  validates :test_date,:med_diagnostic_test_type_id,:result, :presence => true
  belongs_to :client
end
