require 'spec_helper'


describe Mse do
  before do
   user = FactoryGirl.create(:user,:surname => "Ivanov")  
   client = FactoryGirl.create(:client,:name => "Ivanov",:surname => "Petrov",:father_name => "Qwertitv")  

   @mse = FactoryGirl.create(:mse,:user_id => user.id,:send_date => '01.01.2011',:conclusion_date => '04.01.2011',:conclusion_till => 20,:mkb_type => FactoryGirl.create(:mkb_type,:name =>"test",:code => "A10"))
  end


  it 'tests next_conclusion_date' do
    @mse.indefinitely = false
    @mse.next_conclusion_date.should == @mse.conclusion_date + @mse.conclusion_till

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


  it 'test reason_info' do
    @mse.reason =  Mse::REASON_INIT_FIRST 
    @mse.reason_info.should == I18n.t(:mse_first_group)
    @mse.reason =  Mse::REASON_INIT_SECOND 
    @mse.reason_info.should == I18n.t(:mse_second_group)
    @mse.reason =  Mse::REASON_INIT_THIRD 
    @mse.reason_info.should == I18n.t(:mse_third_group)
    @mse.reason =  Mse::REASON_RE_FIRST 
    @mse.reason_info.should == I18n.t(:mse_re_first)
    @mse.reason =  Mse::REASON_RE_SECOND 
    @mse.reason_info.should == I18n.t(:mse_re_second)
    @mse.reason =  Mse::REASON_RE_THIRD 
    @mse.reason_info.should == I18n.t(:mse_re_third)
    @mse.reason =  Mse::REASON_RE_3_1 
    @mse.reason_info.should == I18n.t(:mse_third_to_one)
    @mse.reason =  Mse::REASON_RE_2_1 
    @mse.reason_info.should == I18n.t(:mse_second_to_one)
    @mse.reason =  Mse::REASON_RE_3_2 
    @mse.reason_info.should == I18n.t(:mse_third_to_second)
  end

   it 'tests conclusion_group' do
     @mse.conclusion_group = Mse::C_REFUSED 
     @mse.conclusion_info.should == I18n.t(:mse_refused)
     @mse.conclusion_group = Mse::C_FIRST 
     @mse.conclusion_info.should == I18n.t(:mse_first_group)
     @mse.conclusion_group = Mse::C_SECOND 
     @mse.conclusion_info.should == I18n.t(:mse_second_group)
     @mse.conclusion_group = Mse::C_THIRD 
     @mse.conclusion_info.should == I18n.t(:mse_third_group)
   end

  it 'tests again' do
    @mse.indefinitely = true
    @mse.again.should == I18n.t(:mse_indefinitely)
    @mse.indefinitely = false
    @mse.again.should == I18n.l(@mse.conclusion_date + @mse.conclusion_till)
    @mse.conclusion_date = nil
    @mse.again.should == nil
  end

  it 'test format_date' do
    Mse.format_date(DateTime.new).should == Time.at(DateTime.new.to_i).to_formatted_s(:db)
  end

  it 'test as json' do
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
