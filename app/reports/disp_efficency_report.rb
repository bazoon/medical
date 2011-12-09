class DispEfficencyReport < BaseReport
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


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 disps = Disp.between(sd,ed).non_initial

 on_observation = case num
     when 0 then disps.stable
     when 1 then disps.progress
     when 2 then disps.regress
 end


 on_observation.count unless on_observation.nil?
end





  
end
