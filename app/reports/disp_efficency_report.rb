class DispEfficencyReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 disps = Disp.between(sd,ed)
 disps = apply_sector_num(disps)

 on_observation = case num
     when 1 then disps.stable
     when 2 then disps.progress
     when 3 then disps.regress
 end


 on_observation.count unless on_observation.nil?
end





  
end
