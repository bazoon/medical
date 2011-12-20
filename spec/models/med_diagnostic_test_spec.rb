require 'spec_helper'

describe MedDiagnosticTest do
  before(:all) do
   @med_diagnostic_test = FactoryGirl.create(:med_diagnostic_test,:test_date => '01.01.2011',:result => "ok")
  end

  after(:all) do
    @med_diagnostic_test.destroy
  end


 it 'return hospitalization_type name if not nil' do
   @med_diagnostic_test.hospitalization_type.name = "sunny"
   @med_diagnostic_test.hospitalization_type_name.should == "sunny"

   @med_diagnostic_test.hospitalization_type.name = nil
   @med_diagnostic_test.hospitalization_type_name.should == nil
 end


 it 'mass assign doctor_types' do
  dt1 =FactoryGirl.create(:doctor_type,:name => "e1")
  dt2 =FactoryGirl.create(:doctor_type,:name => "e2")
  dt3 =FactoryGirl.create(:doctor_type,:name => "e3")

  a = "#{dt1.id},#{dt2.id},#{dt3.id}"

  @med_diagnostic_test.doctor_tokens = a
  @med_diagnostic_test.save

  @med_diagnostic_test.doctor_types.should include(dt1,dt2,dt3)


 end


end 

