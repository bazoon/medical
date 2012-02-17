class DiagnosticTest < ActiveRecord::Base
 
  NORM = 1
  BETTER = 2
  WORSE = 3

  belongs_to :diagnostic_test_type, :class_name => 'Ref::DiagnosticTestType'
  validates :test_date,:diagnostic_test_type_id,:total, :presence => true
  belongs_to :client, :counter_cache => true

  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров

  scope :this_year,lambda {current_year} #Анализы за текущий год
  scope :in_year, lambda {|sd,ed| where("test_date between ? and ?",sd,ed)}
  
  scope :client_present,lambda {|e| joins(:client).merge(Client.present(e))}
  scope :client_sector,lambda {|n| joins(:client).merge(Client.sector(n))}
  scope :client_disabled,lambda { joins(:client).merge(Client.disables)}


  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("test_date between ? and ?",start_date,end_date)
  end

  def self.prof_inspection_min
    all.map {|dt| dt if dt.diagnostic_type_tag_list_include?(I18n.t(:prof_tag_name))}.compact
  end

  def diagnostic_type_tag_list_include?(tag_name)
    diagnostic_test_type.tag_list.include?(tag_name) if diagnostic_test_type and diagnostic_test_type.tag_list
  end

 def valid_test?
    test_date+diagnostic_test_type.valid_period >= Date.parse(Time.now.to_s)
 end

  def total_info
   result=case total
           when NORM then I18n.t(:diagnostic_test_norm)
           when BETTER then I18n.t(:diagnostic_test_better)
           when WORSE then I18n.t(:diagnostic_test_worse)
          end 
   result
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

