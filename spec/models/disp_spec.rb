require 'spec_helper'

describe Disp do
  before(:all) do
    @mkb_type =  FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10")
    @disp = FactoryGirl.create(:disp,:actual_date => '01.01.2011',:mkb_type => @mkb_type)
  end

  after(:all) do
    @disp.destroy
    @mkb_type.destroy
  end

  it 'test mkb' do
    @disp.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20") 
    @disp.mkb = "B20: new"
    @disp.mkb_type.code.should == "B20"
    @disp.mkb_type.name.should == "new"
  end


  it 'tests disp_type_info' do
    @disp.disp_type = Disp::PLANNED
    @disp.disp_type_info.should == I18n.t(:disp_plan)
    @disp.disp_type = Disp::INITIAL
    @disp.disp_type_info.should == I18n.t(:disp_initial)
    @disp.disp_type = Disp::OUT
    @disp.disp_type_info.should == I18n.t(:disp_out)
  end

  it 'tests result_info' do
    @disp.result = Disp::STABLE
    @disp.result_info.should == I18n.t(:disp_unchanged)
    @disp.result = Disp::PROGRESS 
    @disp.result_info.should == I18n.t(:disp_improvement)
    @disp.result = Disp::REGRESS
    @disp.result_info.should == I18n.t(:disp_degradation)
  end

end  
