class Ref::LabTestType < ActiveRecord::Base
  has_many :lab_tests
  validates :name,:presence => true

  acts_as_taggable_on :clin_mins #Теги для отнесения типа анализа к тому, или иному набору (клиническому минимуму)
  scope :prof_inspection_minimum,lambda {prof_inspection_min} #Анализы для профосмотров


def can_be_deleted
  lab_tests.count<=0
end

  def self.prof_inspection_min
    all.map {|ltt| ltt if ltt.clin_min_list.include?(I18n.t(:prof_tag_name))}.compact 
  end


end
# == Schema Information
#
# Table name: ref_lab_test_types
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  valid_period :integer
#  norm         :string(255)
#

