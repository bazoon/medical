class Ref::BenefitCategory < ActiveRecord::Base

  WAR_INVALIDS = "10"
  WAR_PARTICIPANTS = "20"
  CONFLICT_PARTICIPANTS = "30"
  WIDOWS = "60"
  BLOKADNIKS = "50"
  PRISONERS = "140,150"                                                                                   
  FRONT_WORKERS = "926"
  REPRESSED = "924"
  CHERNOBIL = "92"
  VETERANS = "10" #change !!!

  FEDERAL = 1
  REGIONAL = 2

  scope :war_invalids,where("code = ? ",WAR_INVALIDS)
  scope :war_participants,where("code in (?) ",WAR_PARTICIPANTS)
  scope :conflict_participants,where("code in (?) ",CONFLICT_PARTICIPANTS)
  scope :widows,where("code in (?) ",WIDOWS)
  scope :blokadniks,where("code in (?) ",BLOKADNIKS)
  scope :prisoners,where("code in (#{PRISONERS})")
  scope :front_workers,where("code in (?) ",FRONT_WORKERS)
  scope :repressed,where("code in (?) ",REPRESSED)
  scope :chernobil,where("code in (?) ",CHERNOBIL)
  scope :veterans,where("code in (?) ",VETERANS)


 has_many :users


def self.id_by_code(c)
 find(:first,:conditions => ["code = ?",c]).id
end  


#def self.war_invalid_id
# find(:first,:conditions => ["code = ?",WAR_INVALIDS]).id
#end  

#def self.war_participants_ids
# ids=[] 
# find(:all,:conditions => ["code IN (?)",["011","020"]]).each do |b|
#  ids << b.id
# end
# ids
#end  


#def self.warriors_codes_ids
# ids=[] 
# find(:all,:conditions => ["code IN (?)",["010","020","030"]]).each do |b|
#  ids << b.id
# end
# ids
#end  

#Инвалид войны
#def is_war_invalid
# code == "010"
#end

def to_s
 "#{code}: #{short_name}"
end  

def code_with_short_name
 "#{code}: #{short_name}"
end

def can_be_deleted
  true
end

def source_string
  case source 
    when FEDERAL
      I18n.t(:federal)
    when REGIONAL
      I18n.t(:regional)
  end
end


end
# == Schema Information
#
# Table name: ref_benefit_categories
#
#  id         :integer         not null, primary key
#  short_name :string(255)
#  full_name  :string(255)
#  percent    :integer
#  created_at :datetime
#  updated_at :datetime
#  source     :integer
#  code       :integer
#

