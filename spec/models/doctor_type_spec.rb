require 'spec_helper'

describe Ref::DoctorType do

  before(:each) do
   @doctor_type = FactoryGirl.create(:doctor_type)
  end

  after(:each) do
   @doctor_type.destroy
  end


  it 'can be deleted if no child records' do
    @doctor_type.can_be_deleted.should == true
   
    user = FactoryGirl.create(:user,:doctor_type_id => @doctor_type.id)
    @doctor_type.can_be_deleted.should == false

    user.destroy
  end

end  
