Then /^I should see lab_test_type table$/ do |expected_table|
 rows = find("#lab_test_types").all('tr')
 table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
 binding.pry
 expected_table.diff!(table)
end

