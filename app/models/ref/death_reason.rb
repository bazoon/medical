class Ref::DeathReason < ActiveRecord::Base
  has_many :clients
  validates :name,:presence => true

  def can_be_deleted
    true
  end  

end
# == Schema Information
#
# Table name: ref_death_reasons
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

