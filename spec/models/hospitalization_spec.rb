require 'spec_helper'

describe Hospitalization do
  before do
   client = FactoryGirl.create(:client,:name => "Ivanov",:surname => "Petrov",:father_name => "Qwertitv")  
   @hosp = FactoryGirl.create(:hospitalization,:client_id => client.id,:request_date => '01.01.2011',:mkb_type => FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10"))
  end

  it 'test mkb' do
    @hosp.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20") 
    @hosp.mkb = "B20: new"
    @hosp.mkb_type.code.should == "B20"
    @hosp.mkb_type.name.should == "new"
  end

  it 'test hospitalization_kind' do
   @hosp.kind = Hospitalization::PLANNED
   @hosp.hospitalization_kind.should ==  I18n.t(:plan_hospitalization)
   @hosp.kind = Hospitalization::EXTRA 
   @hosp.hospitalization_kind.should == I18n.t(:extra_hospitalization)
   @hosp.kind = nil
   @hosp.hospitalization_kind.should == ""
  end

  it 'tests hospitalization_type_name' do
    @hosp.hospitalization_type = FactoryGirl.create(:hospitalization_type,:name => "test")
    @hosp.hospitalization_type_name.should == "test"
    @hosp.hospitalization_type = nil
    @hosp.hospitalization_type_name.should == nil 
  end

 it 'tests period' do
   @hosp.period.should == nil
   @hosp.period_start = Date.parse(Time.now.to_s)
   @hosp.period_end = @hosp.period_start + 30
   @hosp.period.should == "#{I18n.l(@hosp.period_start)} - #{I18n.l(@hosp.period_end)}" 
 end

  it 'tests status_info' do
   @hosp.status = Hospitalization::HOSPITILIZED 
   @hosp.status_info.should == I18n.t(:hosp_hospitilized)
   @hosp.status = Hospitalization::REFUSED 
   @hosp.status_info.should == I18n.t(:hosp_refused)
   @hosp.status = Hospitalization::NO_PLACE 
   @hosp.status_info.should == I18n.t(:hosp_no_place)
   @hosp.status = Hospitalization::UNPROOVED_DIAGNOSIS 
   @hosp.status_info.should == I18n.t(:hosp_unprooved)
  end


end

