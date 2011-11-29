require 'test_helper'

class PeopleStructureReportTest < ActionView::TestCase
  

  test "should count" do
   
    f = File.open('/var/www/rails/medical/log/my', 'w')


    codes=[10,20,30,60,50,140,926,924,92]
    attach_dates=['01.01.2011','01.01.2010']

    codes.each do |c|
      attach_dates.each do |d|
       client = FactoryGirl.create(:client,:attach_date => d)
       benefit = FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => c))
       client.benefits << benefit 
      end
    end

    


    p = PeopleStructureReport.new(view)
    p.prepare('','',[2010,2011])

    assert  p.observed(2011,1) == 2,"2011 10"
    assert  p.observed(2011,2) == 2,"2011 020"
    assert  p.observed(2011,3) == 2,"2011 030"
    assert  p.observed(2010,1) == 1,"2010 010"
    assert  p.observed(2010,2) == 1,"2010 020"
    assert  p.observed(2010,3) == 1,"2010 030"

    assert  p.observed(2011,4) == 2,"2011 60"
    assert  p.observed(2011,5) == 2,"2011 50"
    assert  p.observed(2011,6) == 2,"2011 140"
    assert  p.observed(2010,4) == 1,"2010 60"
    assert  p.observed(2010,5) == 1,"2010 50"
    assert  p.observed(2010,6) == 1,"2010 140"

    assert  p.observed(2011,7) == 2,"2011 926"
    assert  p.observed(2011,8) == 2,"2011 924"
    assert  p.observed(2011,9) == 2,"2011 92"
    assert  p.observed(2010,7) == 1,"2010 926"
    assert  p.observed(2010,8) == 1,"2010 924"
    assert  p.observed(2010,9) == 1,"2010 92"

    assert  p.observed(2010,10) == 0,"2010 pensioner"
    assert  p.observed(2011,10) == 0,"2011 pensioner"



    assert p.year_total(2010) == 10,"2010 total"
    assert p.year_total(2011) == p.year_total(2010)*2,"2010*2=2011 total"

 end


end
