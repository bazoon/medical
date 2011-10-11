class Ref::DiagnosticTestType < ActiveRecord::Base
  validates :name,:presence => true
  has_many :diagnostic_tests 



def can_be_deleted
  diagnostic_tests.count<=0
end

end
