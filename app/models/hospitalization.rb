class Hospitalization < ActiveRecord::Base
  belongs_to :hospitalization_type, :class_name => 'Ref::HospitalizationType'
  belongs_to :client, :counter_cache => true
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  validates :hospitalization_type_id, :presence => true



  def hospitalization_kind
    if kind == 0
      I18n.t(:plan_hospitalization)
    else  
      I18n.t(:extra_hospitalization)
    end
  end


  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end


end
