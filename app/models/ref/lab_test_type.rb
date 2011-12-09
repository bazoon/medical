class Ref::LabTestType < ActiveRecord::Base
  has_many :lab_tests
  validates :name,:presence => true

  acts_as_taggable_on :clin_mins #Теги для отнесения типа анализа к тому, или иному набору (клиническому минимуму)


def can_be_deleted
  lab_tests.count<=0
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

