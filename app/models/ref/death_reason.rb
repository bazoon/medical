class Ref::DeathReason < ActiveRecord::Base
 has_many :clients

def can_be_deleted
  true
end  

end
