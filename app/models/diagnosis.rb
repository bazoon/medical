class Diagnosis < ActiveRecord::Base
  belongs_to :prof_inspection
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'


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
