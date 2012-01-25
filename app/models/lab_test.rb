class LabTest < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :lab_test_type, :class_name => 'Ref::LabTestType'

  validates :result,:test_date,:lab_test_type_name,:presence => true

 # validates :lab_test_type_present

  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров

  scope :this_year,lambda {current_year} #Анализы за текущий год
  scope :in_year, lambda {|sd,ed| where("test_date between ? and ?",sd,ed)}



  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("test_date between ? and ?",start_date,end_date)
  end


  def self.prof_inspection_min
    all.map {|lt| lt if lt.lab_test_type.clin_min_list.include?(I18n.t(:prof_tag_name))}.compact 
  end


 def valid_test?
  test_date+lab_test_type.valid_period >= Date.parse(Time.now.to_s)
 end

 def lab_test_type_name
   lab_test_type.name unless lab_test_type.nil?
 # @lab_test_type_name
 end

 def lab_test_type_name=(name)
#  @lab_test_type_name = name
  self.lab_test_type = Ref::LabTestType.find_by_name(name)

 end


end
# == Schema Information
#
# Table name: lab_tests
#
#  id               :integer         not null, primary key
#  test_date        :date
#  client_id        :integer
#  result           :text
#  created_at       :datetime
#  updated_at       :datetime
#  lab_test_type_id :integer
#

