class LabTest < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :lab_test_type, :class_name => 'Ref::LabTestType'

  validates :result,:test_date,:lab_test_type_id,:presence => true


  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров

  scope :this_year,lambda {current_year} #Анализы за текущий год


  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("test_date between ? and ?",start_date,end_date)
  end


  def self.prof_inspection_min
    all.map {|lt| lt if lt.lab_test_type.clin_min_list.include?(I18n.t(:prof_tag_name))} 
  end


 def valid_test?
  test_date+lab_test_type.valid_period >= Date.parse(Time.now.to_s)
 end




end
