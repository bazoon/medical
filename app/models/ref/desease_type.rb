class Ref::DeseaseType < ActiveRecord::Base
 # has_many :doctor_deseases
  validates :name,:presence => true


def can_be_deleted
 # doctor_deseases.count<=0
end

end
# == Schema Information
#
# Table name: ref_desease_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

