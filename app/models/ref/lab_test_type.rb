class Ref::LabTestType < ActiveRecord::Base
  has_many :lab_tests
  validates :name,:presence => true


def can_be_deleted
  lab_tests.count<=0
end


end
