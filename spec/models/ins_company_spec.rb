require 'spec_helper'


describe Ref::InsCompany do
  before(:each) do
   @ins_company = FactoryGirl.create(:ins_company,:name => "Ins")  
  end

  after(:each) do
   @ins_company.destroy
  end


  it 'returns name when to_s' do
    @ins_company.to_s.should == @ins_company.name
  end

  it 'can be deleted when no clients' do
    @ins_company.can_be_deleted.should == true
    client = FactoryGirl.create(:client,:ins_company_id => @ins_company.id)
    @ins_company.can_be_deleted.should == false

    client.destroy
  end

end  
