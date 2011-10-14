class SanatoriumNote < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  validates :actual_date,:neediness_reference,:client_id,:presence =>true
end
