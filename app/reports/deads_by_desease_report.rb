class DeadsByDeseaseReport < BaseReport



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 


 clients = Client.sector(@sector_num).died_between(sd,ed)


 on_observation = case num
    when 1 then  clients.dr_infections_parasits
    when 2 then  clients.dr_neoplasms
    when 3 then  clients.dr_endocryne_diseases
    when 4 then  clients.dr_blood_diseases
    when 5 then  clients.dr_nervous_diseases
    when 6 then  clients.dr_ear_diseases
    when 7 then  clients.dr_eye_diseases
    when 8 then  clients.dr_circulatory_diseases
    when 9 then  clients.dr_respiratory_diseases
    when 10 then clients.dr_digestive_diseases
    when 11 then clients.dr_genitourinary_diseases
    when 12 then clients.dr_skin_diseases
    when 13 then clients.dr_musculskeletal_diseases
    when 14 then clients.dr_injury_poisons
  end


 on_observation.count unless on_observation.nil?

end


end
