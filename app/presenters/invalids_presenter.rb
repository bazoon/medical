class InvalidsPresenter
  attr_accessor :by_mse_reason_and_year, :by_years
  attr_reader :test
  attr_accessor :years

def initialize(template)
 @template = template  
end

def h
 @template
end

def prepare(sd,ed,years)  
 @years = years

#  war_invalids = Client.includes(:mses,:benefits).where("benefits.benefit_category_id=? and mses.send_date between ? and ? and reason in (?)",Ref::BenefitCategory.war_invalid_id,sd,ed,[5,6,7])
#
#
#  all_mses=[]
#
#  war_invalids.each do |c|
#   c.mses.each {|m| all_mses << m}
#  end
#
#  by_mse_reasons = all_mses.group_by do |mse|
#    
#    case mse.reason
#       when 5 then "3 -> 1"
#       when 6 then "2 -> 1"
#       when 7 then "3 -> 2"
#       else "ERRROR #{mse.reason} | #{mse.client.fio}"
#    end
#
#  end
#    
#    
# @by_years = all_mses.group_by {|m| m.send_date.year }
#
#  @by_mse_reason_and_year=Hash.new
#
#  by_mse_reasons.each_pair do |key,item|
#   @by_mse_reason_and_year[key] = item.group_by {|m| m.send_date.year }
#  end
#
#
# @test = @by_mse_reason_and_year
#

end


#def rel_row_value(items,totals)
# "#{((items.count.to_f / totals.count.to_f)*100).round(2)} %"unless items.nil? or totals.nil?
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
     when 1 then Client.benefit_category("010").mse_group_increased
#    when 2 then Client.benefit_category(benefit).disp_between(sd,ed).disp_initial
#    when 3 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out
#    when 4 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out.moved
#    when 5 then Client.benefit_category(benefit).disp_between(sd,ed).disp_out.died
#    when 6 then Client.benefit_category(benefit).disp_before(ed)
#    when 7 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("081") #инвалиды 1 ой группы
#    when 8 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("082") #инвалиды 1 ой группы
#    when 9 then Client.benefit_category(benefit).disp_before(ed) & Client.benefit_category("083") #инвалиды 1 ой группы
#    when 10 then Client.benefit_category(benefit).disp_before(ed).full_inspected
#    when 11 then Client.benefit_category(benefit).disp_before(ed).rested
 end
#
#
 on_observation.count unless on_observation.nil?
end





end
