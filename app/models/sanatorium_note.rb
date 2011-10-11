class SanatoriumNote < ActiveRecord::Base
  belongs_to :client
  validates :actual_date,:neediness_reference,:client_id,:presence =>true
end
