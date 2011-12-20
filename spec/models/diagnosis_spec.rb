require 'spec_helper'


describe Diagnosis do
  before(:each) do
   @prof_inspection = FactoryGirl.create(:prof_inspection) 
   @mkb_type = FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10")
   @diagnosis = FactoryGirl.create(:diagnosis,:prof_inspection_id => @prof_inspection.id,:mkb_type_id => @mkb_type.id)
  end

  after(:each) do
   @prof_inspection.destroy
   @mkb_type.destroy
   @diagnosis.destroy
  end

  
  it 'test mkb' do
    @diagnosis.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20") 
    @diagnosis.mkb = "B20: new"
    @diagnosis.mkb_type.code.should == "B20"
    @diagnosis.mkb_type.name.should == "new"
  end

  it 'should return + if first_detected and - otherwise' do
    @diagnosis.first_detected = true
    @diagnosis.first.should == "(+)"
    @diagnosis.first_detected = false
    @diagnosis.first.should == "(-)"
  end

  it 'shoudl return yes if stat_card_given and no otherwise' do
    @diagnosis.stat_card = true
    @diagnosis.stat_card_given?.should == I18n.t(:y)
    @diagnosis.stat_card = false
    @diagnosis.stat_card_given?.should == I18n.t(:n)
  end


end  
