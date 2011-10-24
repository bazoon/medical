class SanatoriumNote < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :sanatorium, :class_name => 'Ref::Sanatorium'
  


end
