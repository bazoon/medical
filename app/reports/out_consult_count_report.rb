class OutConsultCountReport < BaseReport
  attr_accessor :years
  attr_accessor :out_places
  

def fill
 meds = MedDiagnosticTest.between(@sd,@ed)
 meds = apply_sector_num(meds)

 @out_places = Hash.new
 @out_total = Hash.new

 meds.each do |m|
  @out_places[m.hospitalization_type.name] ||= Hash.new
  @out_places[m.hospitalization_type.name][m.test_date.year] ||= 0
  @out_places[m.hospitalization_type.name][m.test_date.year] +=1
  @out_total[m.test_date.year] ||= 0
  @out_total[m.test_date.year] += 1
 end
end

def out_total(year)
 @out_total[year] unless @out_total.nil? or @out_total[year].nil?
end










end
