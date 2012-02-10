class DoctorVisitStructureReport < BaseReport


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 profs = ProfInspection.between(sd,ed)
 profs = apply_sector_num(profs)

 on_observation = case num
     when 1 then profs.usial_only
     when 2 then profs.prof_only
 end

 on_observation.count unless on_observation.nil?
end






end
