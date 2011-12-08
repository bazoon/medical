class HospReport < BaseReport
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

  (0..5).to_a.each do |num|
    @observed[y][num] = get_observed(y,num)
  end
 end

 fill_plan_places
end

#Плановая госпитализация
def fill_plan_places
 places = Hospitalization.find_by_sql ["select date_part('year',request_date) as year,ref_hospitalization_types.name,count(*)
                                       as total from hospitalizations,ref_hospitalization_types where (request_date between ? and ?) and 
                                       (ref_hospitalization_types.id=hospitalizations.hospitalization_type_id)  and
                                       (hospitalizations.kind = ?)
                                       group by year,ref_hospitalization_types.name",@sd,@ed,Hospitalization::PLANNED]
 
 @plan_places = Hash.new
 @plan_total = Array.new
 @years.each { |year| @plan_total[year] = 0 }

 places.each do |place|
  @plan_places[place.name] ||=  Hash.new
  @plan_places[place.name][place.year.to_i] = place.total.to_i unless place.nil? or place.name.nil? or place.year.nil? or place.total.nil?
  @plan_total[place.year.to_i] += place.total.to_i 
 end

end

def plan_total(year)
 @plan_total[year] unless @plan_total.nil? or @plan_total[year].nil?
end



#Метод доступа к переменной внутри класса
def observed(year,num)
 @observed[year][num]
end


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 hosps = Hospitalization.between(sd,ed).extra

 on_observation = case num
    when 0 then  hosps.hospitilized
    when 1 then  hosps.hospitilized
    when 2 then  hosps.unhospitilized
    when 3 then  hosps.refused
    when 4 then  hosps.no_place
    when 5 then  hosps.unprooved_diagnosis
 end



#
#
 on_observation.count unless on_observation.nil?
end


  
end
