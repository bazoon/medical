class Ref::DoctorType < ActiveRecord::Base
  has_many :users
  validates :name,:presence => true


def can_be_deleted
  users.count<=0
end
  
end
# == Schema Information
#
# Table name: ref_doctor_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

