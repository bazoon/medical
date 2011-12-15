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
  client.detach_reason = Client::DETACH_REASON_NONE
  client.detach_reason_info.should == I18n.t(:detach_reason_none)
  client.detach_reason = Client::DETACH_REASON_OTHER_CLINIC
  client.detach_reason_info.should == I18n.t(:detach_reason_other_clinic)
  client.detach_reason = Client::DETACH_REASON_DIED_AT_HOME
  client.detach_reason_info.should == I18n.t(:detach_reason_died_at_home)
  client.detach_reason = Client::DETACH_REASON_DIED_AT_CLINIC
  client.detach_reason_info.should == I18n.t(:detach_reason_died_at_clinic)
 end

 it "should_test_have_full_prof_inspections_in_year_male" do
  client = FactoryGirl.create(:client,:client_sex_id => Client::MALE)
  client.prof_inspections.count.should == 0
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_zero

  (1..11).each { |i|  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF) }
  
  client.prof_inspections.count.should == 11
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_partial

  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF)
  
  client.prof_inspections.count.should == 12
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_all
 end


 it "should_test_have_full_prof_inspections_in_year_female" do
  client = FactoryGirl.create(:client,:client_sex_id => Client::FEMALE)
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_zero

  (1..12).each { |i|  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF) }
  client.have_full_prof_inspection_in_year('01.01.2011','31.12.2011').should == :prof_partial

  FactoryGirl.create(:prof_inspection,:client_id => client.id,:actual_date => '01.01.2011',:inspection_type => ProfInspection::PROF)
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
   client = FactoryGirl.create(:client,:name => "Petr",:surname => "Petrov")
   Client.search("Petr").count.should == 1


   client = FactoryGirl.create(:client,:name => "Ivan",:surname => "Petrov",:father_name => "Petrovich")
   Client.search("Petrov Ivan Petrovich").count.should == 1

   Client.search("Petrov").count.should == 2

   Client.search("Petrov Ivan").count.should == 1
   
   Client.search("abracadabra").count.should == 0

   Client.search("").count.should == 2
   Client.search(nil).count.should == 2
   Client.search("abr a cad abra").count.should == 2
 end


  it "should test has_some_records?" do
    client = FactoryGirl.create(:client)
    FactoryGirl.create(:prof_inspection,:client_id => client.id)
    client.has_some_records?(:prof_inspections).should == true
  end

 it "should make fio" do
   client = Client.new
   client.name ="Ivan"
   client.surname = "Petrov"
   client.father_name = "Olegovich"
   client.fio.should == "Petrov Ivan Olegovich"
 end
 
 it "should make short fio" do
   client = Client.new
   client.surname = "Petrov"
   client.short_fio.should == "Petrov"
   client.name ="Ivan"
   client.father_name = "Olegovich"
   client.short_fio.should == "Petrov I. O."
 end


end
