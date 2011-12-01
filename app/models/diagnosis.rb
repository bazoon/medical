class Diagnosis < ActiveRecord::Base
  belongs_to :prof_inspection
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'


  scope :tisis,joins(:mkb_type).merge(Ref::MkbType.tisis)
  scope :neoplasm,joins(:mkb_type).merge(Ref::MkbType.neoplasm)
  scope :glaukoma,joins(:mkb_type).merge(Ref::MkbType.glaukoma)
  scope :diabet,joins(:mkb_type).merge(Ref::MkbType.diabet)

 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
  code = name[0,name.index(":")]
  self.mkb_type = Ref::MkbType.find_by_code(code)
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


  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end

end
