class MedDiagnosticTestDoctor < ActiveRecord::Base
  belongs_to :med_diagnostict_test
  belongs_to :doctor_type, :class_name => 'Ref::DoctorType' 
end
# == Schema Information
#
# Table name: med_diagnostic_test_doctors
#
#  id                     :integer         not null, primary key
#  doctor_type_id         :integer
#  med_diagnostic_test_id :integer
#  created_at             :datetime
#  updated_at             :datetime
#

