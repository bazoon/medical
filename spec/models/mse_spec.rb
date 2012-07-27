require 'spec_helper'


describe Mse do
  before(:all) do
   @user = FactoryGirl.create(:user,:surname => "Ivanov")
   @client = FactoryGirl.create(:client,:name => "Ivanov",:surname => "Petrov",:father_name => "Qwertitv")
   @mkb_type = FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10")
   @mse = FactoryGirl.create( :mse,:user_id => @user.id,:send_date => '01.01.2011',:conclusion_date => '04.01.2011',:conclusion_till => '05.02.2012',:mkb_type => @mkb_type)
  end

  after(:all) do
   @mse.destroy
   @user.destroy
   @client.destroy
   @mkb_type.destroy
  end


  it 'tests next_conclusion_date' do
    @mse.indefinitely = false
    @mse.next_conclusion_date.should == @mse.conclusion_till

    @mse.indefinitely = true
    @mse.next_conclusion_date.should == nil
  end

  it 'test mkb' do
    @mse.mkb.should == "A10: test"
  end

  it 'test mkb=' do
    mkb_type = FactoryGirl.create(:mkb_type,:name => "new",:code => "B20")
    @mse.mkb = "B20: new"
    @mse.mkb_type.code.should == "B20"
    @mse.mkb_type.name.should == "new"
  end


#  it 'tests mkb_info' do
#    @mse.mkb_info.should == "test"
#  end




  it 'tests again' do
    @mse.indefinitely = true
    @mse.again.should == I18n.t(:mse_indefinitely)
    @mse.indefinitely = false
    @mse.again.should == I18n.l(@mse.conclusion_till)
  end

  it 'test format_date' do
    Mse.format_date(DateTime.new).should == Time.at(DateTime.new.to_i).to_formatted_s(:db)
  end

  it 'test as json' do
    @mse.conclusion_date = "01.01.2011"
    @mse.conclusion_till = "04.04.2011"
    h =
    { :id => @mse.id,
      :title => @mse.client.fio,
      :description => "Descr",
      :start => @mse.next_conclusion_date.rfc822,
      :end => @mse.next_conclusion_date.rfc822,
      :allDay => false,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.client_mses_path(@mse.client.id)
   }

   @mse.as_json.should == h
  end


end
