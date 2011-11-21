class Ref::DeathReason < ActiveRecord::Base
  has_many :clients
  validates :name,:presence => true

  def can_be_deleted
    true
  end  

end
