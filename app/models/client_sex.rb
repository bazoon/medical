class ClientSex < ActiveRecord::Base

def to_s
  sex  
end  

end
# == Schema Information
#
# Table name: client_sexes
#
#  id         :integer         not null, primary key
#  sex        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

