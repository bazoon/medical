require 'spec_helper'

describe Ref::Sanatorium do

  before(:each) do
   @sanatorium = FactoryGirl.create(:sanatorium)
  end

  after(:each) do
   @sanatorium.destroy
  end


  it 'can be deleted if no child records' do
    @sanatorium.can_be_deleted.should == true
   
    client = FactoryGirl.create(:client)
    sanatorium_note = FactoryGirl.create(:sanatorium_note,:client_id => client.id,:sanatorium_id => @sanatorium.id)
    @sanatorium.can_be_deleted.should == false

    client.destroy
    sanatorium_note.destroy
  end

end  
