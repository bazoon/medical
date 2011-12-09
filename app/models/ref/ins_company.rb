class Ref::InsCompany < ActiveRecord::Base
  has_many :clients
  validates :name,:presence => true

def to_s
  name
end  

def can_be_deleted
 clients.count<=0  
end

end
# == Schema Information
#
# Table name: ref_ins_companies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

