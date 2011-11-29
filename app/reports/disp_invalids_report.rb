class DispInvalidsReport < BaseReport
 attr_accessor :by_years_and_benefit, :benefits, :by_year_and_benefit
 attr_accessor :years 


def prepare(sd,ed,years)
  @years = years

  @by_years_and_benefit = Hash.new
  @benefits = ["020","010","030"]

  years.each do |y|
   @by_years_and_benefit[y] = @benefits
  end
end


def fill(years,items,num)
 @observed = Hash.new 
 @observed[num] ||= Hash.new
 years.each do |y|
  items.each do |b|
   @observed[num][y] ||= Hash.new
   @observed[num][y][b] = get_observed(y,b,num) 
  end
 end
end


#Метод доступа к переменной внутри класса
def observed(year,benefit,num)
 @observed[num][year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def observed_total(year,num)
 sum = 0
 @observed[num][year].each {|k,v| sum = sum +v}
 sum
end



#private

def get_observed(year,benefit,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 
 

 on_observation = case num
    when 1 then Client.benefit_category(benefit).disp_before(sd)
    when 2 then Client.benefit_category(benefit).disp_between(sd,ed).disp_initial
    when 3 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out
    when 4 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out.moved
    when 5 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out.died
    when 6 then Client.benefit_category(benefit).disp_before(ed)
    when 7 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("081") #инвалиды 1 ой группы
    when 8 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("082") #инвалиды 1 ой группы
    when 9 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("083") #инвалиды 1 ой группы
    when 10 then Client.benefit_category(benefit).disp_before(ed).full_inspected
    when 11 then Client.benefit_category(benefit).disp_before(ed).rested
 end

  count = case num
    when 1 then get_initial_non_out_count(on_observation,sd)
    when 6 then get_initial_non_out_count(on_observation,ed)
     
    else on_observation.count       
  end

 
 count
end

#Выборка тех, кто не был снят с учета после постановки
def get_initial_non_out_count(clients,sd)
 observed_count = Hash.new

 
 clients.each do |client|
 by_mkb = client.disps.before(sd).group_by {|d| d.mkb_type.code }
  
 observed_count[client.id] = 0

  by_mkb.each_pair do |m,items|
   sorted_disps = items.sort {|a,b| a.actual_date <=> b.actual_date } 

#   puts "#{client.fio}  #{sorted_disps.inspect}"

   if sorted_disps.last.disp_type !=3
    observed_count[client.id] = observed_count[client.id] + 1 unless observed_count[client.id] == 1
 #   puts "Yes: #{client.id} count: #{observed_count[client.id]} type: #{sorted_disps.last.disp_type}"
   end
 
  end  
 end

 sum = 0
 observed_count.each {|k,v| sum = sum + v}

 sum
# observed_count.inspect
end



end
