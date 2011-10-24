class Ref::LabTestType < ActiveRecord::Base
  has_many :lab_tests
  validates :name,:presence => true

  acts_as_taggable_on :clin_mins #Теги для отнесения типа анализа к тому, или иному набору (клиническому минимуму)


def can_be_deleted
  lab_tests.count<=0
end


end
