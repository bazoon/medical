class SicknessRateReport < BaseReport
  attr_accessor :years






private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 diagnoses = Diagnosis.between(sd,ed).first_time.stat_card_only
 diagnoses = apply_sector_num(diagnoses)

 on_observation = case num
    when 1 then  diagnoses.infections_parasits
    when 2 then  diagnoses.neoplasms
    when 3 then  diagnoses.endocryne_diseases
    when 4 then  diagnoses.blood_diseases
    when 5 then  diagnoses.nervous_diseases
    when 6 then  diagnoses.ear_diseases
    when 7 then  diagnoses.eye_diseases
    when 8 then  diagnoses.circulatory_diseases
    when 9 then  diagnoses.respiratory_diseases
    when 10 then diagnoses.digestive_diseases
    when 11 then diagnoses.genitourinary_diseases
    when 12 then diagnoses.skin_diseases
    when 13 then diagnoses.musculskeletal_diseases
    when 14 then diagnoses.injury_poisons
 end



#
#
 on_observation.count unless on_observation.nil?
end


  


end
