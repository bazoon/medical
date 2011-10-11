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
