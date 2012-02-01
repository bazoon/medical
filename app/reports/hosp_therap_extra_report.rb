class HospTherapExtraReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 hosps = Hospitalization.between(sd,ed).extra
 hosps = apply_sector_num(hosps)

 on_observation = case num
    when 1 then  hosps.circulatory_diseases
    when 2 then  hosps.respiratory_diseases
    when 3 then  hosps.digestive_diseases
 end


#
#
 on_observation.count unless on_observation.nil?
end




end
