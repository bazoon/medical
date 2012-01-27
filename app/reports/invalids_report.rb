class InvalidsReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year

def initialize(template)
 @template = template  
end

def h
 @template
end

def prepare(sd,ed,years)  
 @years = years

 @totals_by_year = Hash.new

 @years.each do |y|
   sd = Date.new(y,1,1) 
   ed = Date.new(y,12,31) 
   @totals_by_year[y] = Client.mse_between(sd,ed).count
 end


end


#def rel_row_value(abs_value,year)
# "#{((abs_value.to_f / @totals_by_year[year].to_f)*100).round(2)} %" unless abs_value
#end
#
#def abs_row_value(items)
# items.count unless items.nil?
#end



def fill(years,num)
 @observed = Hash.new 
 @observed[num] ||= Hash.new
 years.each do |y|
  @observed[num][y] = get_observed(y,num)
 end
end


#Метод доступа к переменной внутри класса
def observed(year,num)
 @observed[num][year]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def observed_total(year,num)
 sum = 0
# @observed[num][year].each {|k,v| sum = sum +v}
 sum
end



#private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 


 on_observation = case num
     when 1 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased
     when 2 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased_2_1
     when 3 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased_3_2
     when 4 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased
     when 41 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased_2_1
     when 42 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased_3_2
     when 5 then Client.mse_between(sd,ed).mse_iprs
     when 6 then Client.mse_between(sd,ed).mse_first
     when 7 then Client.mse_between(sd,ed).mse_re
     when 8 then Client.mse_between(sd,ed).mse_re_2
     when 9 then Client.mse_between(sd,ed).mse_re_3
     when 10 then Client.mse_between(sd,ed).mse_re_3_2
     when 11 then Client.disables.mse_between(sd,ed)
 end
#
#
 on_observation.count unless on_observation.nil?
end





end
