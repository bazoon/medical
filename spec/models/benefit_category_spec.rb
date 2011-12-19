require 'spec_helper'

describe Ref::BenefitCategory do


  before(:all) do
    @benefit_category = FactoryGirl.create(:benefit_category,:short_name => "wow",:full_name => "wow wow",:percent => 100,:source => 1, :code => 10)
  end

  after(:all) do
    @benefit_category.destroy
  end


 it 'returns id by code' do
  Ref::BenefitCategory.id_by_code(10).should == @benefit_category.id 
 end

 it 'converts to string'  do
   @benefit_category.to_s.should == "10: wow"
 end

 it 'makes code with short_name' do
  @benefit_category.code_with_short_name.should == "10: wow"
 end

 it 'can be deleted ?' do
  @benefit_category.can_be_deleted.should == true  
 end

  it 'must return source finance string' do
    @benefit_category.source = Ref::BenefitCategory::FEDERAL
    @benefit_category.source_string.should == I18n.t(:federal)
    @benefit_category.source = Ref::BenefitCategory::REGIONAL
    @benefit_category.source_string.should == I18n.t(:regional)
  end


end  
