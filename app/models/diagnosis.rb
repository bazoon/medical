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
  
end
