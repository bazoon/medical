class Ref::DoctorType < ActiveRecord::Base
  has_many :users
  has_many :doctor_deseases
  validates :name,:presence => true


def can_be_deleted
  users.count<=0
end
  
end
