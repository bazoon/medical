class Ref::DiagnosticTestType < ActiveRecord::Base
  validates :name,:presence => true
  has_many :diagnostic_tests 

  acts_as_taggable #Теги 


def can_be_deleted
  diagnostic_tests.count<=0
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

