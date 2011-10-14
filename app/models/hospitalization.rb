class Hospitalization < ActiveRecord::Base
  belongs_to :hospitalization_type, :class_name => 'Ref::HospitalizationType'
  belongs_to :client, :counter_cache => true

  validates :hospitalization_type_id, :actual_date, :presence => true
end
