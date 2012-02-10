class DoctorFunctionReport  < BaseReport

private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 profs = ProfInspection.between(sd,ed).usial_only 
 profs = apply_sector_num(profs)

 visit_count = profs.count
 uniq_client_count = profs.map(&:client_id).uniq.count

 on_observation_count = case num
     when 1 then visit_count
     when 2 then visit_count / uniq_client_count 
 end
#
#
 on_observation_count unless on_observation_count.nil?
end







end

