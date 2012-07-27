require 'spec_helper'


describe ProfInspection do
  before(:all) do
   @user = FactoryGirl.create(:user,:surname => "Ivanov")
   @prof_inspection = FactoryGirl.create(:prof_inspection,:user_id => @user.id,:actual_date => Time.now)
   @mkb_type = FactoryGirl.create(:mkb_type,:name =>"test")
   @diagnosis = FactoryGirl.create(:diagnosis,:mkb_type_id => @mkb_type.id,:prof_inspection_id => @prof_inspection.id )
  end

  after(:all) do
   @prof_inspection.destroy
   @user.destroy
   @diagnosis.destroy
   @mkb_type.destroy
  end


 it "Should search" do
   ProfInspection.search(Time.now.strftime("%d.%m.%y")).count.should == 1
   ProfInspection.search(Time.now.strftime("%Y")).count.should == 1
   ProfInspection.search("Ivanov").count.should == 1
   ProfInspection.search("test").count.should == 1
   ProfInspection.search("abra").count.should == 0
   ProfInspection.search("").count.should == 1
   ProfInspection.search(nil).count.should == 1
 end


 it "should test local actual_date" do
   @prof_inspection.actual_date_local.should == I18n.l(@prof_inspection.actual_date)
 end

 it "should test set local actual_date" do
   @prof_inspection.actual_date_local = Date.parse("01.02.2011")
   @prof_inspection.actual_date.should == Date.parse('01.02.2011')
 end


 it "should test current year" do
  ProfInspection.current_year.count.should == 1
 end


 it "should test  year" do
  ProfInspection.year(Time.now.strftime("%Y").to_i).count.should == 1
 end

 it "tests inspection_type_info" do
  @prof_inspection.inspection_type = ProfInspection::USIAL
  @prof_inspection.inspection_type_info.should == I18n.t(:prof_inspection_usial)

  @prof_inspection.inspection_type = ProfInspection::PROF
  @prof_inspection.inspection_type_info.should == I18n.t(:prof_inspection_prof)
 end

  it 'should test prof_inspection?' do
   @prof_inspection.inspection_type = ProfInspection::PROF
   @prof_inspection.prof_inspection?.should == true
  end



end
