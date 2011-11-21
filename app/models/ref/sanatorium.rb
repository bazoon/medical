class Ref::Sanatorium < ActiveRecord::Base
 validates :name,:presence => true

def can_be_deleted
 true  
end

end
