class Disp < ActiveRecord::Base
  belongs_to :client
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user 

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
