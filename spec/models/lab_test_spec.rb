require 'spec_helper'

describe LabTest do
  before(:all) do
   @lab_test_type = FactoryGirl.create(:lab_test_type,:name =>"test")
   @lab_test = FactoryGirl.create(:lab_test,:test_date => Time.now,:result => "ok",:lab_test_type => @lab_test_type )
  end

  after(:all) do
    @lab_test_type.destroy
    @lab_test.destroy
  end

  it 'test current_year' do
    LabTest.current_year.count.should == 1
  end


 it 'tests prof_inspection_min' do
   LabTest.find(:all).count == 1
   LabTest.prof_inspection_min.should == []
   @lab_test.lab_test_type.clin_min_list << I18n.t(:prof_tag_name)
   @lab_test.lab_test_type.save
   a = Array.new
   a << @lab_test
   LabTest.prof_inspection_min.should == a
 end


 it 'tests valid_test?' do
   @lab_test.test_date = Date.parse((Time.now).to_s) - 6
   @lab_test.lab_test_type.valid_period = 3
   @lab_test.valid_test?.should == false
   @lab_test.test_date = Date.parse((Time.now).to_s) - 2
   @lab_test.valid_test?.should == true
 end


end
