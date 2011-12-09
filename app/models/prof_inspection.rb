class ProfInspection < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :user
  has_many :diagnoses,:dependent => :delete_all,:order => "id"
  validates :actual_date,:user_id,:client_id, :presence =>true

  scope :this_year,lambda {current_year} #Осмотры за текущий год

  scope :in_year, lambda {|sd,ed| where("actual_date between ? and ?",sd,ed)}




  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("actual_date between ? and ?",start_date,end_date)
  end


  


end
# == Schema Information
#
# Table name: prof_inspections
#
#  id          :integer         not null, primary key
#  client_id   :integer
#  actual_date :date
#  user_id     :integer
#  conclusion  :text
#  created_at  :datetime
#  updated_at  :datetime
#  mkb_type_id :integer
#

