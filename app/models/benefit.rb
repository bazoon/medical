class Benefit < ActiveRecord::Base
  belongs_to :client, :counter_cache => true  
  belongs_to :benefit_category, :class_name => 'Ref::BenefitCategory'
  validates :benefit_category_id,:doc_name,:presence => true

  before_save :check_primary_field



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
