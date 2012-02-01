class ImobileHospReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year
  attr_accessor :plan_places



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 hosps = Hospitalization.between(sd,ed)
 hosps = apply_sector_num(hosps)

 on_observation = case num
    when 1 then  hosps.planned
    when 2 then  hosps.extra
 end

 on_observation.count unless on_observation.nil?
end



end
