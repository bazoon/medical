class OutConsultCountReport < BaseReport
  attr_accessor :years
  attr_accessor :out_places
  
def prepare(sd,ed,years)  
 @sd = sd
 @ed = ed
 @years = years
 @years_total=Array.new

 fill_out_places
end

#Плановая госпитализация
def fill_out_places
 @places = MedDiagnosticTest.find_by_sql ["select date_part('year',test_date) as year,ref_hospitalization_types.name,count(*)
                                          as total from med_diagnostic_tests,ref_hospitalization_types where (test_date between ? and ?) and 
                                          (ref_hospitalization_types.id=med_diagnostic_tests.hospitalization_type_id)  
                                          group by year,ref_hospitalization_types.name",@sd,@ed]
 
 @out_places = Hash.new
 @out_total = Array.new
 @years.each { |year| @out_total[year] = 0 }

 @places.each do |place|
  @out_places[place.name] ||=  Hash.new
  @out_places[place.name][place.year.to_i] = place.total.to_i unless place.nil? or place.name.nil? or place.year.nil? or place.total.nil?
  @out_total[place.year.to_i] += place.total.to_i 
 end

end

def out_total(year)
 @out_total[year] unless @out_total.nil? or @out_total[year].nil?
end










end
