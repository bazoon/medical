class HospTherapExtraReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year



def prepare(sd,ed,years)  
 @years = years
 @years_total=Array.new

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (0..2).to_a.each do |num|
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

 hosps = Hospitalization.between(sd,ed).extra

 on_observation = case num
    when 0 then  hosps.circulatory_diseases
    when 1 then  hosps.respiratory_diseases
    when 2 then  hosps.digestive_diseases
 end



#
#
 on_observation.count unless on_observation.nil?
end




end
