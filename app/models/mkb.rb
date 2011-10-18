class Mkb < ActiveRecord::Base
  belongs_to :client, :counter_cache => true  
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  validates :client_id,:mkb_type_id,:actual_date,:presence => true




    
end
