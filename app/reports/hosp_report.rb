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

# @years.each do |y|
#  
#  @observed[y] = Array.new
#
#  (0..14).to_a.each do |num|
#    @observed[y][num] = get_observed(y,num)
#  end
# end

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





def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
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



private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 diagnoses = Diagnosis.between(sd,ed).first_time

 on_observation = case num
    when 0 then  diagnoses.infections_parasits
    when 1 then  diagnoses.neoplasms
    when 2 then  diagnoses.endocryne_diseases
    when 3 then  diagnoses.blood_diseases
    when 4 then  diagnoses.nervous_diseases
    when 5 then  diagnoses.ear_diseases
    when 6 then  diagnoses.eye_diseases
    when 7 then  diagnoses.circulatory_diseases
    when 8 then  diagnoses.respiratory_diseases
    when 9 then  diagnoses.digestive_diseases
    when 10 then diagnoses.genitourinary_diseases
    when 11 then diagnoses.skin_diseases
    when 12 then diagnoses.musculskeletal_diseases
    when 13 then diagnoses.injury_poisons
 end



#
#
 on_observation.count unless on_observation.nil?
end


  
end
