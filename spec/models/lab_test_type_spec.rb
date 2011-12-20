require 'spec_helper'

describe Ref::LabTestType do

  before(:each) do
   @lab_test_type = FactoryGirl.create(:lab_test_type)
  end

  after(:each) do
   @lab_test_type.destroy
  end

  it 'can be deleted if no child records' do
    @lab_test_type.can_be_deleted.should == true
     
    lab_test = FactoryGirl.create(:lab_test,:lab_test_type_id => @lab_test_type.id)
    @lab_test_type.can_be_deleted.should == false

    lab_test.destroy
  end

end  
