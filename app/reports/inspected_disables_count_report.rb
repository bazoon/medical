class InspectedDisablesCountReport < BaseReport
  attr_accessor :tests, :tests_total

def fill
 diagnostics = DiagnosticTest.in_year(@sd,@ed).client_present(@ed).client_disabled
 diagnostics = apply_sector_num(diagnostics)

 @tests = Hash.new
 @tests_total = Hash.new

 diagnostics.each do |d|
  @tests[d.diagnostic_test_type.name] ||= Hash.new
  @tests[d.diagnostic_test_type.name][d.test_date.year] ||= 0
  @tests[d.diagnostic_test_type.name][d.test_date.year] +=1
  @tests_total[d.test_date.year] ||= 0
  @tests_total[d.test_date.year] += 1
 end


 labs = LabTest.in_year(@sd,@ed).client_present(@ed).client_disabled
 labs = apply_sector_num(labs)


 labs.each do |l|
  @tests[l.lab_test_type.name] ||= Hash.new
  @tests[l.lab_test_type.name][l.test_date.year] ||= 0
  @tests[l.lab_test_type.name][l.test_date.year] +=1
  @tests_total[l.test_date.year] ||= 0
  @tests_total[l.test_date.year] += 1
 end



end

def tests_total(year)
 @tests_total[year] unless @tests_total.nil? or @tests_total[year].nil?
end




end
