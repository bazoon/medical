class Hospitalization < ActiveRecord::Base
  belongs_to :hospitalization_type, :class_name => 'Ref::HospitalizationType'
  belongs_to :client

  validates :hospitalization_type_id, :actual_date, :presence => true
end
