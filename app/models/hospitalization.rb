class Hospitalization < ActiveRecord::Base
  belongs_to :hospitalization_type, :class_name => 'Ref::HospitalizationType'
  belongs_to :client, :counter_cache => true
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  #validates :hospitalization_type_id, :presence => true

  #Statuses
  HOSPITILIZED = 0
  REFUSED = 1
  NO_PLACE = 2
  UNPROOVED_DIAGNOSIS =3

  #Types
  PLANNED = 0
  EXTRA = 1


  scope :planned, where("kind = ?",PLANNED)
  scope :extra, where("kind = ?",EXTRA)


  scope :between, lambda {|s,e| where("request_date between ? and ?",s,e) }
  scope :hospitilized, where("status = ?",HOSPITILIZED)
  scope :unhospitilized, where("status <> ?",HOSPITILIZED)
  scope :refused, where("status = ?",REFUSED)
  scope :no_place, where("status = ?",NO_PLACE)
  scope :unprooved_diagnosis, where("status = ?",UNPROOVED_DIAGNOSIS)


  scope :blood_diseases, joins(:mkb_type).merge(Ref::MkbType.blood_diseases)
  scope :circulatory_diseases, joins(:mkb_type).merge(Ref::MkbType.circulatory_diseases)
  scope :respiratory_diseases,joins(:mkb_type).merge(Ref::MkbType.respiratory_diseases)
  scope :digestive_diseases, joins(:mkb_type).merge(Ref::MkbType.digestive_diseases)




 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
  code = name[0,name.index(":")]
  self.mkb_type = Ref::MkbType.find_by_code(code)
 end

  def hospitalization_kind
   result = case kind 
      when 0 then I18n.t(:plan_hospitalization)
      when 1 then I18n.t(:extra_hospitalization)
      else ""  
    end
   result 
  end

  def hospitalization_type_name
    hospitalization_type.name unless hospitalization_type.nil?
  end

  def period
    "#{I18n.l(period_start)} - #{I18n.l(period_end)}" unless period_start.nil? or period_end.nil?
  end

  def status_info
    result=case status
            when HOSPITILIZED then I18n.t(:hosp_hospitilized)
            when REFUSED then I18n.t(:hosp_refused)
            when NO_PLACE then I18n.t(:hosp_no_place)
            when UNPROOVED_DIAGNOSIS then I18n.t(:hosp_unprooved)
    end
   result 
  end

  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end


end
