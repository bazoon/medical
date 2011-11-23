class PeopleStructurePresenter
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


def rel_row_value(abs_value,year)
 "#{((abs_value.to_f / @totals_by_year[year].to_f)*100).round(2)} %" unless abs_value.nil?
 
end
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

 clients = Client.includes(:benefits => :ref_benefit_catagories).present(ed)

 on_observation = case num
     when 1 then clients.benefit_category("010")
     when 2 then clients.benefit_category("020")
     when 3 then clients.benefit_category("030")
     when 4 then clients.benefit_category("060")
     when 5 then clients.benefit_category("050")
     when 6 then clients.benefit_category("140") + clients.benefit_category("150")
     when 7 then clients.benefit_category("926")
     when 8 then clients.benefit_category("924")
     when 9 then clients.benefit_category("092")
     when 10 then clients.benefit_category("010")
     when 11 then clients.benefit_category("010")
 end
#
#
 on_observation.count unless on_observation.nil?
end







end
