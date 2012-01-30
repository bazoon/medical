class DispByGroupReport < BaseReport
  attr_accessor :years
  attr_accessor :groups
  


private


def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 mkbs = Mkb.present(ed).client_present(ed).before(ed) 

 mkbs = apply_sector_num(mkbs)

 on_observation = case num
     when 1 then mkbs.disp_group(1)
     when 2 then mkbs.disp_group(2)
     when 3 then mkbs.disp_group(3)
     when 4 then mkbs.disp_group(4)
     when 5 then mkbs.disp_group(5)
 end

 on_observation.count unless on_observation.nil?
end


end
