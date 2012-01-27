class Diagnosis < ActiveRecord::Base
  belongs_to :prof_inspection
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  has_one :client,:through => :prof_inspection

  #delegate :mkb,:mkb=,:to => :mkb_type, :allow_nil => true


  scope :disease_like,lambda {|n| joins(:mkb_type).merge(Ref::MkbType.disease_like(n)) }

  scope :tisis,joins(:mkb_type).merge(Ref::MkbType.tisis)
  scope :neoplasm,joins(:mkb_type).merge(Ref::MkbType.neoplasm)
  scope :glaukoma,joins(:mkb_type).merge(Ref::MkbType.glaukoma)
  scope :diabet,joins(:mkb_type).merge(Ref::MkbType.diabet)

  scope :infections_parasits, joins(:mkb_type).merge(Ref::MkbType.infections_parasits)
  scope :neoplasms, joins(:mkb_type).merge(Ref::MkbType.neoplasms)
  scope :endocryne_diseases,joins(:mkb_type).merge(Ref::MkbType.endocryne_diseases)
  scope :blood_diseases, joins(:mkb_type).merge(Ref::MkbType.blood_diseases)
  scope :nervous_diseases,joins(:mkb_type).merge(Ref::MkbType.nervous_diseases)
  scope :ear_diseases, joins(:mkb_type).merge(Ref::MkbType.ear_diseases)
  scope :eye_diseases, joins(:mkb_type).merge(Ref::MkbType.eye_diseases)
  scope :circulatory_diseases, joins(:mkb_type).merge(Ref::MkbType.circulatory_diseases)
  scope :respiratory_diseases,joins(:mkb_type).merge(Ref::MkbType.respiratory_diseases)
  scope :digestive_diseases, joins(:mkb_type).merge(Ref::MkbType.digestive_diseases)
  scope :genitourinary_diseases,joins(:mkb_type).merge(Ref::MkbType.genitourinary_diseases)
  scope :skin_diseases, joins(:mkb_type).merge(Ref::MkbType.skin_diseases)
  scope :musculskeletal_diseases,joins(:mkb_type).merge(Ref::MkbType.musculskeletal_diseases)
  scope :injury_poisons, joins(:mkb_type).merge(Ref::MkbType.injury_poisons)

  scope :between,lambda { |s,e| joins(:prof_inspection).where("prof_inspections.actual_date between ? and ?",s,e) }
  scope :first_time,where("first_detected = true")
  scope :client_sector, lambda {|sector_num| joins(:prof_inspection).merge(ProfInspection.client_sector(sector_num))}


 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
  code = name[0,name.index(":")]
  self.mkb_type = Ref::MkbType.find_by_code(code)
 end


def mkb_type_name
  mkb_type.name unless mkb_type.nil?
end  

def mkb_type_code
  mkb_type.code unless mkb_type.nil?
end  

def first
  if first_detected
   "(+)" 
  else  
   "(-)"
  end
  
end
 
def stat_card_given?
  if stat_card
    I18n.t(:y)
  else
    I18n.t(:n)
  end
end  


#  def mkb_info
#    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
#  end

end
# == Schema Information
#
# Table name: diagnoses
#
#  id                 :integer         not null, primary key
#  prof_inspection_id :integer
#  mkb_type_id        :integer
#  first_detected     :boolean         default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  stat_card          :boolean         default(FALSE)
#

