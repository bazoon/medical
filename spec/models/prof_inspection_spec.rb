require 'spec_helper'


describe ProfInspection do
  before do
   user = FactoryGirl.create(:user,:surname => "Ivanov")  
   @prof_inspection = FactoryGirl.create(:prof_inspection,:user_id => user.id,:actual_date => '01.01.2011')
   diagnosis = FactoryGirl.create(:diagnosis,:mkb_type => FactoryGirl.create(:mkb_type,:name =>"test"),:prof_inspection_id => @prof_inspection.id )
  end

 it "Should search" do
   ProfInspection.search("01.01.2011").count.should == 1
   ProfInspection.search("2011").count.should == 1
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
  ProfInspection.year(2011).count.should == 1
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
