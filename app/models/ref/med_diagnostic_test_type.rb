class Ref::MedDiagnosticTestType < ActiveRecord::Base
  validates :name,:presence => true
  has_many :med_diagnostic_tests 



def can_be_deleted
  med_diagnostic_tests.count<=0
end


end
