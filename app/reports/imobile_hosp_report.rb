class ImobileHospReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year
  attr_accessor :plan_places


def prepare(sd,ed,years)  
 @sd = sd
 @ed = ed
 @years = years
 @years_total=Array.new

 @observed = Hash.new 

 @years.each do |y|

  @observed[y] = Array.new

  (0..1).to_a.each do |num|
    @observed[y][num] = get_observed(y,num)
  end
 end
end

#Метод доступа к переменной внутри класса
def observed(year,num)
 @observed[year][num]
end

def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
end  

private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 hosps = Hospitalization.between(sd,ed)

 on_observation = case num
    when 0 then  hosps.planned
    when 1 then  hosps.extra
 end

 on_observation.count unless on_observation.nil?
end



end
