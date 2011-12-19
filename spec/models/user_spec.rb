require 'spec_helper'

describe User do


  before(:all) do
    @doctor_type = FactoryGirl.create(:doctor_type,:name => "surgeon")
    @user = FactoryGirl.create(:user,:name => "Ivan",:surname => "Petrov",:father_name => "Ivanovich",:doctor_type_id => @doctor_type.id)
  end

  after(:all) do
    @user.destroy
    @doctor_type.destroy
  end

  it 'returns users with surname like %' do
    User.surname_like("a do not exists").count.should == 0
    User.surname_like("Petr").count.should == 1
  end

  it 'returns short_fio' do
    @user.short_fio.should == "#{@user.surname} #{@user.name[0]}. #{@user.father_name[0]}."
    @empty_user = User.new
    @empty_user.short_fio.should == nil
  end

  it 'returns short_fio with doctor type' do
    @user.doctor_type.name.should == "surgeon" 
    @user.short_fio_with_doctor_type.should == "#{@user.surname} #{@user.name[0]}. #{@user.father_name[0]}. | #{@user.doctor_type.name}" 
    @empty_user = User.new
    @empty_user.short_fio_with_doctor_type.should == nil
  end

end  
