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
    @disp.mkb.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    @disp.mkb_type = mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20")
    @disp.save!
    @disp.mkb.mkb = "B20: new"
    @disp.mkb_type.code.should == "B20"
    @disp.mkb_type.name.should == "new"
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
