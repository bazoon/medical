require 'spec_helper'

describe DiagnosticTest do
  set(:diagnostic_test) do
    FactoryGirl.create(:diagnostic_test,:test_date => '01.01.2011',:diagnostic_test_type => FactoryGirl.create(:diagnostic_test_type,:name =>"test"))
  end

  it 'test current_year' do
    DiagnosticTest.current_year.count.should == 1
  end


 it 'tests prof_inspection_min' do
   DiagnosticTest.find(:all).count == 1
   DiagnosticTest.prof_inspection_min.should == []
   diagnostic_test.diagnostic_test_type.tag_list << I18n.t(:prof_tag_name)
   diagnostic_test.diagnostic_test_type.save
   a = Array.new
   a << diagnostic_test
   DiagnosticTest.prof_inspection_min.should == a
 end


 it 'tests valid_test?' do
   diagnostic_test.test_date = Date.parse((Time.now).to_s) - 5
   diagnostic_test.diagnostic_test_type.valid_period = 3
   diagnostic_test.valid_test?.should == false
   diagnostic_test.test_date = Date.parse((Time.now).to_s) - 2
   diagnostic_test.valid_test?.should == true
 end


end
