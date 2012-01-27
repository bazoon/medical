class ProfDeseaseFreqReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year


def prepare(sd,ed,years)  
 @years = years
 @years_total=Array.new

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (0..3).to_a.each do |num|
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
     when 0 then diagnoses.tisis
     when 1 then diagnoses.neoplasm
     when 2 then diagnoses.glaukoma
     when 3 then diagnoses.diabet
 end
#
#
 on_observation.count unless on_observation.nil?
end





end
