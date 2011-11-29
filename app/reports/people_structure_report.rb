class PeopleStructureReport < BaseReport
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
 @years_total=Array.new

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (0..10).to_a.each do |num|
   @observed[y][num] = get_observed(y,num)
  end

 end


end


def rel_row_value(abs_value,year)
 "#{((abs_value.to_f / @totals_by_year[year].to_f)*100).round(2)} %" unless abs_value.nil?
end
#
#def abs_row_value(items)
# items.count unless items.nil?
#end

def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
end  

def fill(years,num)
 years.each do |y|
  @observed[num][y] = get_observed(y,num)
 end
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



#private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 clients = Client.includes(:benefits => :ref_benefit_catagories).present(ed)

 on_observation = case num
     when 0 then clients.war_invalids
     when 1 then clients.war_participants
     when 2 then clients.conflict_participants
     when 3 then clients.widows
     when 4 then clients.blokadniks
     when 5 then clients.prisoners
     when 6 then clients.front_workers
     when 7 then clients.repressed
     when 8 then clients.chernobil
     when 9 then clients.veterans
     when 10 then clients.pensioners
 end
#
#
 on_observation.count unless on_observation.nil?
end







end
