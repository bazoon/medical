
require 'spec_helper'

describe Ref::DiagnosticTestType do

  before(:each) do
   @diagnostic_test_type = FactoryGirl.create(:diagnostic_test_type)
  end

  after(:each) do
   @diagnostic_test_type.destroy
  end

  it 'can be deleted if no child records' do
    @diagnostic_test_type.can_be_deleted.should == true
     
    diagnostic_test = FactoryGirl.create(:diagnostic_test,:diagnostic_test_type_id => @diagnostic_test_type.id)
    @diagnostic_test_type.can_be_deleted.should == false

    diagnostic_test.destroy
  end

end  
