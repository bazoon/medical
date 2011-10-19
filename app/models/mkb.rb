class Mkb < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  validates :client_id,:mkb_type_id,:actual_date,:user_id,:presence => true




    
end
