require 'spec_helper'

describe Benefit do


  before(:all) do
    @benefit_category = FactoryGirl.create(:benefit_category,:short_name => "wow",:full_name => "wow wow",:percent => 100,:source => 1, :code => 10)
    @client = FactoryGirl.create(:client,:name => "Ivan",:surname => "Petrov",:father_name => "Ivanovich")
    @benefit = FactoryGirl.create(:benefit,:client_id => @client.id, :benefit_category_id => @benefit_category.id)
  end

  after(:all) do
    @benefit.destroy
    @client.destroy  
    @benefit_category.destroy
  end



   it 'saves the prim benefit or make it if none exists' do
    @benefit.prim = true
    @benefit.check_primary_field #for coverage only
    @benefit.save!
    @benefit.prim.should == true

    bc = FactoryGirl.create(:benefit_category,:short_name => "wow1",:full_name => "wow wow wow",:percent => 100,:source => 1, :code => 20)
    benefit = FactoryGirl.create(:benefit,:client_id => @client.id, :benefit_category_id => bc.id)
    benefit.prim = true
    benefit.save!

    Benefit.find(@benefit.id).prim.should == false
   end

   it 'compiles document info' do
     @benefit.doc_name = "pasp"
     @benefit.doc_seria = "71"
     @benefit.doc_num = "90"
     @benefit.doc_given_by = "uvd"
     @benefit.document.should == "#{I18n.t(:document)} pasp #{I18n.t(:seria)} 71 #{I18n.t(:num)} 90 #{I18n.t(:given_by)} uvd"
     @benefit.doc_date = "01.01.2011"
     @benefit.document.should == "#{I18n.t(:document)} pasp #{I18n.t(:seria)} 71 #{I18n.t(:num)} 90 #{I18n.t(:given_by)} uvd 01.01.2011"
   end

  it 'say yes if primary and no if not' do
    @benefit.prim = true
    @benefit.primary_benefit?.should == I18n.t(:y)
    @benefit.prim = false
    @benefit.primary_benefit?.should == I18n.t(:n)
  end






end
