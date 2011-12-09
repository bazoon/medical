class DiagnosticTest < ActiveRecord::Base
  belongs_to :diagnostic_test_type, :class_name => 'Ref::DiagnosticTestType'
  validates :test_date,:diagnostic_test_type_id,:result, :presence => true
  belongs_to :client, :counter_cache => true

  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров

  scope :this_year,lambda {current_year} #Анализы за текущий год


  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("test_date between ? and ?",start_date,end_date)
  end


  def self.prof_inspection_min
    all.map {|lt| lt if lt.diagnostic_test_type.tag_list.include?(I18n.t(:prof_tag_name))} 
  end


 def valid_test?
  test_date+diagnostic_test_type.valid_period >= Date.parse(Time.now.to_s)
 end

end
# == Schema Information
#
# Table name: diagnostic_tests
#
#  id                      :integer         not null, primary key
#  test_date               :date
#  diagnostic_test_type_id :integer
#  client_id               :integer
#  result                  :text
#  created_at              :datetime
#  updated_at              :datetime
#

