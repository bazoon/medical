class Benefit < ActiveRecord::Base
  belongs_to :client, :counter_cache => true  
  belongs_to :benefit_category, :class_name => 'Ref::BenefitCategory'
  belongs_to :ref_benefit_category, :class_name => 'Ref::BenefitCategory',:foreign_key => "benefit_category_id"
  validates :benefit_category_id,:doc_name,:presence => true

  before_save :check_primary_field

  before_save :add_to_client
  after_destroy :remove_from_client 

  #scope :war_invalids, includes(:benefit_category).where("ref_benefit_categories.code=?","010")   
 

  scope :first_group_invalids, includes(:benefit_category).where("ref_benefit_categories=?","081")

 # scope :war_invalids,find_by_sql("select code from benefits,ref_benefit_categories where benefits.benefit_category_id=ref_benefit_categories.id and code in (?)",Ref::BenefitCategory::WAR_INVALIDS)




#  scope :war_participants,where("benefit_catecode in (?) ",WAR_PARTICIPANTS)
#  scope :conflict_participants,where("code in (?) ",CONFLICT_PARTICIPANTS)
#  scope :widows,where("code in (?) ",WIDOWS)
#  scope :blokadniks,where("code in (?) ",BLOKADNIKS)
#  scope :prisoners,where("code in (?) ",PRISONERS)
#  scope :front_workers,where("code in (?) ",FRONT_WORKERS)
#  scope :repressed,where("code in (?) ",REPRESSED)
#  scope :chernobil,where("code in (?) ",CHERNOBIL)
#  scope :veterans,where("code in (?) ",VETERANS)

def check_primary_field
  client_benefits = Benefit.where(:client_id => client_id)
  n = client_benefits.count

  if self.prim
    client_benefits.each do |b|
      b.prim = false
      b.save!
    end
  end

 #Если других льгот нет, то единственная будет основной
 if n == 0
   self.prim = true
 end
end


def add_to_client
end

def remove_from_client



end

def document
 "#{I18n.t(:document)} #{doc_name} #{I18n.t(:seria)} #{doc_seria} #{I18n.t(:num)} #{doc_num} #{I18n.t(:given_by)} #{doc_given_by} #{I18n.l(doc_date)}       "
end  

def primary_benefit?
 if prim
   I18n.t(:y)
 else  
   I18n.t(:n)
 end

end  

end
