require 'spec_helper'

describe Ref::HospitalizationType do

  before(:each) do
   @htm_help_type = FactoryGirl.create(:htm_help_type)
  end

  after(:each) do
   @htm_help_type.destroy
  end

  it 'can be deleted if no child records' do
    @htm_help_type.can_be_deleted.should == true
     
    htm_help_note = FactoryGirl.create(:htm_help_note,:htm_help_type_id => @htm_help_type.id)
    @htm_help_type.can_be_deleted.should == false

    htm_help_note.destroy
  end

end  
