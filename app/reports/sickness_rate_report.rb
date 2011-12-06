class SicknessRateReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year



def prepare(sd,ed,years)  
 @years = years
 @years_total=Array.new

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (0..14).to_a.each do |num|
    @observed[y][num] = get_observed(y,num)
  end

 end

end


def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
end  


#Метод доступа к переменной внутри класса
def observed(year,num)
 @observed[year][num]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def observed_total(year,num)
 sum = 0
# @observed[num][year].each {|k,v| sum = sum +v}
 sum
end



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 diagnoses = Diagnosis.between(sd,ed).first_time

 on_observation = case num
    when 0 then  diagnoses.infections_parasits
    when 1 then  diagnoses.neoplasms
    when 2 then  diagnoses.endocryne_diseases
    when 3 then  diagnoses.blood_diseases
    when 4 then  diagnoses.nervous_diseases
    when 5 then  diagnoses.ear_diseases
    when 6 then  diagnoses.eye_diseases
    when 7 then  diagnoses.circulatory_diseases
    when 8 then  diagnoses.respiratory_diseases
    when 9 then  diagnoses.digestive_diseases
    when 10 then diagnoses.genitourinary_diseases
    when 11 then diagnoses.skin_diseases
    when 12 then diagnoses.musculskeletal_diseases
    when 13 then diagnoses.injury_poisons
 end



#
#
 on_observation.count unless on_observation.nil?
end


  


end
