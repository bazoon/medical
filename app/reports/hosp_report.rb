class HospReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year
  
  attr_accessor :plan_places

  

def fill
 hosps = Hospitalization.planned.between(@sd,@ed)
 hosps = apply_sector_num(hosps)

 @plan_places = Hash.new
 @plan_total = Hash.new

 hosps.each do |h|
  @plan_places[h.hospitalization_type.name] ||= Hash.new
  @plan_places[h.hospitalization_type.name][h.request_date.year] ||= 0
  @plan_places[h.hospitalization_type.name][h.request_date.year] +=1
  @plan_total[h.request_date.year] ||= 0
  @plan_total[h.request_date.year] += 1
 end
end


def plan_total(year)
 @plan_total[year] unless @plan_total.nil? or @plan_total[year].nil?
end


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 hosps = Hospitalization.between(sd,ed).extra
 hosps = apply_sector_num(hosps)

 on_observation = case num
    when 1 then  hosps.hospitilized
    when 2 then  hosps.hospitilized
    when 3 then  hosps.unhospitilized
    when 4 then  hosps.refused
    when 5 then  hosps.no_place
    when 6 then  hosps.unprooved_diagnosis
 end


#
#
 on_observation.count unless on_observation.nil?
end


  
end
