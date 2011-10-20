class ProfInspection < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :user
  has_many :diagnoses
  validates :actual_date,:user_id,:client_id, :presence =>true

  scope :this_year,lambda {current_year}


  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("actual_date between ? and ?",start_date,end_date)
  end


end
