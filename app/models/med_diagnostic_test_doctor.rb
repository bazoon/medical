class MedDiagnosticTestDoctor < ActiveRecord::Base
  belongs_to :med_diagnostict_test
  belongs_to :doctor_type, :class_name => 'Ref::DoctorType' 
end
