require 'spec_helper'


describe Client do

 it "get blood group" do
  client = Client.new
  client.blood_group = 1
  client.blood.should == "O(I) Rh+"
  client.blood_group = 2
  client.blood.should == "O(I) Rh-"
 end

 it "should get detach_reson_info" do
  client = Client.new
  client.detach_reason = 1
  client.detach_reason_info.should == I18n.t(:detach_reason_other_clinic)
 end

 it "should_test_have_full_prof_inspections_in_year" do
  client = FactoryGirl.create(:client,:client_sex_id => 1)
  client.prof_inspections.count.should == 0
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_zero

  (1..11).each { |i|  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF) }
  
  client.prof_inspections.count.should == 11
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_partial

  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF)
  
  client.prof_inspections.count.should == 12
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_all
 end


 it "should_test_have_full_prof_inspections_this_year" do
  sd = Date.parse(Time.now.to_s)

  client = FactoryGirl.create(:client,:client_sex_id => 1)
  client.prof_inspections.count.should == 0
  client.have_full_prof_inspection_this_year?.should == :prof_zero

  (1..11).each { |i|  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => sd,:inspection_type => ProfInspection::PROF) }
  
  ProfInspection.count.should == 11

  client.prof_inspections.count.should == 11
  client.have_full_prof_inspection_this_year?.should == :prof_partial

  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => sd,:inspection_type => ProfInspection::PROF)
  
  client.prof_inspections.count.should == 12
  client.have_full_prof_inspection_this_year?.should == :prof_all
 end

 it "should implement local_date" do
  client = Client.new
  client.local_date(:attach_date).should == nil
  client.attach_date = Date.parse(Time.now.to_s)
  client.local_date(:attach_date).should == I18n.l(client.attach_date)
 end

 it "should make passport" do
   client = Client.new
   client.pasp_seria = "71 03"
   client.pasp_num = "654789"
   client.passport.should == "71 03 654789"
 end
  

 it "should make work_info" do
   client = Client.new
   client.work_place = "OOO ERTY"
   client.work_position = "Dir"
   client.work_info.should == "OOO ERTY / Dir"
 end

 it "should search someone if exists" do
   client = FactoryGirl.create(:client,:name => "Ivan",:surname => "Petrov")
   Client.search("Petr").count.should == 1
 end

end
