require 'test_helper'

class PeopleStructurePresenterTest < ActionView::TestCase
  

  test "should do smth" do
   
    f = File.open('/var/www/rails/medical/log/my', 'w')



    b_010_1=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 10))
    b_020_1=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 20))
    b_030_1=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 30))
    b_010_2=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 10))
    b_020_2=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 20))
    b_030_2=FactoryGirl.create(:benefit,:benefit_category => FactoryGirl.create(:benefit_category,:code => 30))

    wi_2011 = FactoryGirl.create(:client,:attach_date => '01.02.2011')
    wp_2011 = FactoryGirl.create(:client,:attach_date => '01.02.2011')
    cp_2011 = FactoryGirl.create(:client,:attach_date => '01.02.2011')

    wi_2010 = FactoryGirl.create(:client,:attach_date => '01.02.2010')
    wp_2010 = FactoryGirl.create(:client,:attach_date => '01.02.2010')
    cp_2010 = FactoryGirl.create(:client,:attach_date => '01.02.2010')


    wi_2011.benefits << b_010_1
    wp_2011.benefits << b_020_1
    cp_2011.benefits << b_030_1

    wi_2010.benefits << b_010_2
    wp_2010.benefits << b_020_2
    cp_2010.benefits << b_030_2
    
     p = PeopleStructurePresenter.new(view)
 
     f.write("client count #{Client.count} \n")
     f.write("wi_2011: #{wi_2011.benefits.count} \n")
     f.write("wp_2011: #{wp_2011.benefits.count} \n")
     f.write("cp_2011: #{cp_2011.benefits.count} \n")
     f.write("wi_2010: #{wi_2010.benefits.count} \n")
     f.write("wp_2010: #{wp_2010.benefits.count} \n")
     f.write("cp_2010: #{cp_2010.benefits.count} \n")

    Client.all.each do |c|

      c.benefits.each do |b|

        f.write("client: #{c.id}, code: #{b.benefit_category.code} \n")

      end

    end



    f.write("clients = #{Client.all.map(&:detach_date).inspect}")
     
     
    assert  p.get_observed(2011,1) == 2,"2011 10"
    assert  p.get_observed(2011,2) == 2,"2011 020"
    assert  p.get_observed(2011,3) == 2,"2011 030"
    assert  p.get_observed(2010,1) == 1,"2010 010"
    assert  p.get_observed(2010,2) == 1,"2010 020"
    assert  p.get_observed(2010,3) == 1,"2010 030"



  end


end
