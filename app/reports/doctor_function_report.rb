class DoctorFunctionReport  < BaseReport

private

def get_observed(year,num)
 sd = Date.new(year,1,1)
 ed = Date.new(year,12,31)

 profs = ProfInspection.between(sd,ed).usial_only
 profs = apply_sector_num(profs)

 uniq_client_count = profs.map(&:client_id).uniq.count
 average_visits_count = 0
 average_visits_count = visit_count / uniq_client_count unless uniq_client_count == 0

 on_observation_count = case num
     when 1 then profs.count
     when 2 then  average_visits_count
 end
#
#
 on_observation_count unless on_observation_count.nil?
end







end

