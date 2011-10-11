class Ref::DoctorDesease < ActiveRecord::Base
  belongs_to :doctor_type,:class_name => "DoctorType"
  belongs_to :desease_type, :class_name => "DeseaseType"
end
