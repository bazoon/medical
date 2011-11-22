class Disp < ActiveRecord::Base
  belongs_to :client
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user 


  scope :initial, where("disp_type = 2")
  scope :out, where("disp_type =3")
  scope :planned, where("disp_type = 1")
  scope :non_out, where("disp_type in (2,1)")
  
  scope :before, lambda {|d| where("disps.actual_date < ?",d)}
  scope :between, lambda {|s,e| where("disps.actual_date between ? and ?",s,e)}


 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
   code = name[0,name.index(":")]
   self.mkb_type = Ref::MkbType.find_by_code(code)
 end


  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end

  def disp_type_info
   result=case disp_type
           when 1 then I18n.t(:disp_plan)
           when 2 then I18n.t(:disp_initial)
           when 3 then I18n.t(:disp_out)
          end 
   result
  end



  def result_info
   res=case result
           when 1 then I18n.t(:disp_unchanged)
           when 2 then I18n.t(:disp_improvement)
           when 3 then I18n.t(:disp_degradation)
          end 
   res
  end



end
