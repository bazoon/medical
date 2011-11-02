class Mse < ActiveRecord::Base
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  belongs_to :client



  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end


  def first_info
   result=case first
           when 1 then I18n.t(:mse_first_group)
           when 2 then I18n.t(:mse_second_group)
           when 3 then I18n.t(:mse_third_group)
          end 
   result
  end
     

  def re_info
   result=case re
           when 0 then I18n.t(:mse_unchanged)
           when 1 then I18n.t(:mse_third_to_one)
           when 2 then I18n.t(:mse_second_to_one)
           when 3 then I18n.t(:mse_third_to_second)
          end 
   result
  end


  def conclusion_info
   result=case conclusion_group
           when 0 then I18n.t(:mse_refused)
           when 1 then I18n.t(:mse_first_group)
           when 2 then I18n.t(:mse_second_group)
           when 3 then I18n.t(:mse_third_group)
          end 
   result
  end


  def again
    if indefinitely
      result = I18n.t(:mse_indefinitely)
    else
      result = I18n.l(conclusion_date + conclusion_till) unless conclusion_date.nil?
    end
  end

end
