class BenefitObserver < ActiveRecord::Observer
  


def after_save(benefit)

 
 kod_010 = benefit.client.benefits.select {|b| b.benefit_category.code == "010"}
 kod_020 = benefit.client.benefits.select {|b| b.benefit_category.code == "020"}
 kod_030 = benefit.client.benefits.select {|b| b.benefit_category.code == "030"}

 benefit.client.is_ivov = (kod_010.count > 0 )
 benefit.client.is_uov = (kod_020.count > 0)
 benefit.client.is_ubd = (kod_030.count > 0)



 benefit.client.save


end  



end
