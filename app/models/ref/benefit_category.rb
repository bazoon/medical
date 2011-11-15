class Ref::BenefitCategory < ActiveRecord::Base
  has_many :users


def self.war_invalid_id
 find(:first,:conditions => ["code = ?","010"]).id
end  

def self.war_participants_ids
 ids=[] 
 find(:all,:conditions => ["code IN (?)",["011","020"]]).each do |b|
  ids << b.id
 end
 ids
end  

#Инвалид войны
def is_war_invalid
 code == "010"
end


def to_s
 "#{code}: #{short_name} "
end  

def code_with_short_name
 "#{code}: #{short_name} "
end

def can_be_deleted
  true
end

def source_string
  case source 
    when 1 
      I18n.t(:federal)
    when 2 
      I18n.t(:regional)
  end
end


end
