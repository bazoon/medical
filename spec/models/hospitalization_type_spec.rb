require 'spec_helper'

describe Ref::HospitalizationType do

  before(:each) do
   @hospitalization_type = FactoryGirl.create(:hospitalization_type)
  end

  after(:each) do
   @hospitalization_type.destroy
  end


  it 'can be deleted if no child records' do
    @hospitalization_type.can_be_deleted.should == true
   
    hospitalization = FactoryGirl.create(:hospitalization,:hospitalization_type_id => @hospitalization_type.id)
    @hospitalization_type.can_be_deleted.should == false

    hospitalization.destroy
  end

end  
