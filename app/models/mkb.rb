class Mkb < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  validates :client_id,:mkb_type_id,:actual_date,:user_id,:presence => true
  
  

 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
   code = name[0,name.index(":")]
   self.mkb_type = Ref::MkbType.find_by_code(code)
 end


    
end
