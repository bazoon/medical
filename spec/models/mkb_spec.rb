require 'spec_helper'

describe Mkb do

  before(:each) do
   @user = FactoryGirl.create(:user,:surname => "Ivanov")  
   @client = FactoryGirl.create(:client,:name => "Ivanov",:surname => "Petrov",:father_name => "Qwertitv")  
   @mkb_type = FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10")
   @mkb = FactoryGirl.create(:mkb,:client_id => @client.id,:user_id => @user.id,:actual_date => '01.01.2011',:mkb_type => @mkb_type)
  end

  after(:each) do
   @mkb.destroy
   @user.destroy
   @client.destroy
   @mkb_type.destroy
  end


  it 'test mkb' do
    @mkb.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20") 
    @mkb.mkb = "B20: new"
    @mkb.mkb_type.code.should == "B20"
    @mkb.mkb_type.name.should == "new"
  end


end  
