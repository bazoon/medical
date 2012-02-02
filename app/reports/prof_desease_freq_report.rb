class ProfDeseaseFreqReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 diagnoses = Diagnosis.between(sd,ed).prof_only.first_time
 diagnoses = apply_sector_num(diagnoses)

 on_observation = case num
     when 1 then diagnoses.tisis
     when 2 then diagnoses.neoplasm
     when 3 then diagnoses.glaukoma
     when 4 then diagnoses.diabet
 end
#
#
 on_observation.count unless on_observation.nil?
end





end
