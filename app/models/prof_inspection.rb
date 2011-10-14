class ProfInspection < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :user
  validates :actual_date,:user_id,:conclusion,:client_id, :presence =>true
end
