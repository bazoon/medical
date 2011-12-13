class ProfInspection < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :user
  has_many :diagnoses,:dependent => :delete_all,:order => "id"

  has_many :mkb_types,:through => :diagnoses  
  has_one :doctor_type,:through => :user  

  validates :actual_date,:user_id,:client_id, :presence =>true

  accepts_nested_attributes_for :diagnoses,:allow_destroy => true


  scope :disease_like,lambda {|n| joins(:diagnoses,:mkb_types).merge(Ref::MkbType.disease_like(n)) }
  scope :user_surname_like,lambda {|n| joins(:user).merge(User.surname_like(n)) }
 
  

  USIAL = 0
  PROF = 1

  scope :this_year,lambda {current_year} #Осмотры за текущий год

  scope :in_year, lambda {|sd,ed| where("actual_date between ? and ?",sd,ed)}


  def self.search(s)
    if s
     a= disease_like(s) 
     b= user_surname_like(s)
     result = a.empty? ? b : a
    else  
     scoped 
    end

  end  

  def actual_date_local
   I18n.l(actual_date)   
  end

  def actual_date_local=(d)
   self.actual_date = d
  end


  def self.current_year
    start_date=Time.now.beginning_of_year
    end_date=Time.now.end_of_year
    where("actual_date between ? and ?",start_date,end_date)
  end


  def inspection_type_info
   result=case(inspection_type)   
           when USIAL then I18n.t(:prof_inspection_usial) 
           when PROF then I18n.t(:prof_inspection_prof) 
           end
   result 
  end
 
  def prof_inspection?
    inspection_type == PROF
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

