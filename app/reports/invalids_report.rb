class InvalidsReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year


def year_total(year)
 @observed[year][1] + @observed[year][4] + @observed[year][7] + @observed[year][8] + @observed[year][9] unless @observed.nil? or @observed[year].nil?
end  



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 


 on_observation = case num
     when 1 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased
     when 2 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased_2_1
     when 3 then Client.benefit_category("010").mse_between(sd,ed).mse_group_increased_3_2
     when 4 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased
     when 5 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased_2_1
     when 6 then Client.benefit_category("020").mse_between(sd,ed).mse_group_increased_3_2
     when 7 then Client.mse_between(sd,ed).mse_iprs
     when 8 then Client.mse_between(sd,ed).mse_first
     when 9 then Client.mse_between(sd,ed).mse_re
     when 10 then Client.mse_between(sd,ed).mse_re_2
     when 11 then Client.mse_between(sd,ed).mse_re_3
     when 12 then Client.mse_between(sd,ed).mse_re_3_2
     when 13 then Client.disables.mse_between(sd,ed)
 end
#
#
 on_observation = on_observation.sector(@sector_num)  

 on_observation.count unless on_observation.nil?
end





end
