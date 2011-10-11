class Ref::DeseaseType < ActiveRecord::Base
  has_many :doctor_deseases
  validates :name,:presence => true


def can_be_deleted
  doctor_deseases.count<=0
end

end
