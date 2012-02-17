class Ref::DiagnosticTestType < ActiveRecord::Base
  validates :name,:presence => true
  has_many :diagnostic_tests 

  acts_as_taggable #Теги 
  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров


def can_be_deleted
  diagnostic_tests.count<=0
end

 def self.prof_inspection_min
   all.map {|dtt| dtt if dtt.tag_list and dtt.tag_list.include?(I18n.t(:prof_tag_name))}.compact 
 end

 


end
# == Schema Information
#
# Table name: ref_diagnostic_test_types
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  valid_period :integer
#

